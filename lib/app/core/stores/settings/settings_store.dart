import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:package_database/package_database.dart';
import 'package:package_module/package_module.dart';
import '../../constants/local_table_consts.dart';

class SettingsStore {
  DatabaseService databaseService;

  SettingsStore({required this.databaseService});

  ValueNotifier<bool> isDark = ValueNotifier(false);
  ValueNotifier<bool> netWork = ValueNotifier(false);

  String lat = "";
  String lon = "";

  netCheck()  {
    InternetConnection().onStatusChange.listen((InternetStatus status) {
      switch (status) {
        case InternetStatus.connected:
          netWork.value = true;
          AppRoutes.navigation(path: "/");
          break;
        case InternetStatus.disconnected:
          netWork.value = false;
          
          break;
      }
    });
  }

  changeTheme() {
    isDark.value = !isDark.value;
    saveSettings();
  }

  saveSettings() async {
    await databaseService.save(LocalTableConstants.settings,
        {LocalTableConstants.isDark: isDark.value});
  }

  getSettings() async {
    try {
      final settingsData =
          await databaseService.getString(LocalTableConstants.settings);

      if (settingsData != null) {
        var settings = json.decode(settingsData);

        isDark.value = settings[LocalTableConstants.isDark];
      }

      return true;
    } catch (e) {
      debugPrint("sem Settings");
    }
  }
}
