import 'package:flutter/material.dart';
import 'package:package_module/package_module.dart';
import 'package:package_uikit/theme/themes.dart';

import 'color/colors.dart';
import 'fonts/fonts.dart';

class DarkTheme extends CustomTheme  with CustomFontsDark{
  @override
  get primaryColor => ModularSinglito.get<AppColor>().secondary;

  @override
  get secondary => AppColor().primaryColor;

  @override
  get scaffoldBackgroundColor => Colors.black;

  @override
  get primaryDark => Colors.white;

    @override
  get appBarTheme => const AppBarTheme(
        backgroundColor: Colors.black,
      );

  @override
  get backgroundColor => Colors.black;

  @override
  get textTheme => makeInputTextTheme();

   @override
  get cardBackgroundColor => Colors.black;
}
