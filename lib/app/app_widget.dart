import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:package_module/package_module.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/stores/settings/settings_store.dart';
import 'core/theme/dark.dart';
import 'core/theme/light.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, c) {
        return AnimatedBuilder(
            animation: ModularSinglito.get<SettingsStore>().isDark,
            builder: (context, w) {
              return MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(textScaler: const TextScaler.linear(1.0)),
                child: MaterialApp.router(
                  debugShowCheckedModeBanner: false,
                  title: 'WeatherTracker',
                  localizationsDelegates: const [
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: const [
                    Locale('en', "US"),
                    Locale('pt', "BR"),
                  ],
                  builder: EasyLoading.init(),
                  theme: ModularSinglito.get<SettingsStore>().isDark.value
                      ? DarkTheme().themeData()
                      : LightTheme().themeData(),
                  routeInformationParser:
                      ModularSinglito.routeInformationParser(),
                  routerDelegate: ModularSinglito.routerDelegate(),
                ),
              );
            });
      },
    );
  }
}
