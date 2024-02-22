import 'package:cloudwalkone/app/core/theme/color/colors.dart';
import 'package:flutter/material.dart';
import 'package:package_module/package_module.dart';
import 'package:package_uikit/theme/themes.dart';

import 'fonts/fonts.dart';

class LightTheme extends CustomTheme with CustomFontsLight {
  @override
  get primaryColor => ModularSinglito.get<AppColor>().primaryColor;

  @override
  get secondary => AppColor().primaryColor;

  @override
  get scaffoldBackgroundColor => Colors.white;

  @override
  get primaryDark => Colors.black;

  @override
  get appBarTheme => const AppBarTheme(
        backgroundColor: Colors.white,
      );

  @override
  get backgroundColor => Colors.white;

  @override
  get textTheme => makeInputTextTheme();
  @override
  get cardBackgroundColor => Colors.white;

}
