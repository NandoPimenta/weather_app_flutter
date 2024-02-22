import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:package_database/package_database.dart';
import '../../constants/local_table_consts.dart';

class SettingsStore {
  DatabaseService databaseService;

  SettingsStore({required this.databaseService});

  ValueNotifier<bool> isDark = ValueNotifier(false);

  String lat = "";
  String lon = "";


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
