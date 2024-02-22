import 'package:flutter/material.dart';
import 'package:package_uikit/theme/colors.dart';
import 'package:package_utils/extensions/color/hex_color.dart';
class AppColor extends CustomColor {
 @override
  Color get primaryColor => HexColor.fromHex('#FF0000');

 @override
  Color get statusBarPrimaryColor => HexColor.fromHex('#FF0000');
  //e87775
 @override
  Color get secondary => HexColor.fromHex('#C8C88F');


  Color get scaffoldBackgroundColor => const Color.fromRGBO(230, 230, 230, 1); 
}

