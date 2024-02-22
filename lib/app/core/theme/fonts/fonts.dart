import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

mixin CustomFontsLight {
  TextTheme makeInputTextTheme() => TextTheme(
        titleLarge: GoogleFonts.roboto(
            textStyle: TextStyle(
                fontSize: 40.sp,
                color: Colors.black,
                fontWeight: FontWeight.bold)),
        titleMedium: GoogleFonts.roboto(
              textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 28.sp,
                  fontWeight: FontWeight.bold)),
        titleSmall: GoogleFonts.roboto(
              textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold)),
        bodyLarge: GoogleFonts.roboto(
          fontSize: 28.sp,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
        bodyMedium: GoogleFonts.roboto(
            textStyle: TextStyle(
                fontSize: 16.sp,
                color: Colors.black,
                fontWeight: FontWeight.w500)),
        bodySmall: GoogleFonts.roboto(
            textStyle: TextStyle(
                fontSize: 14.sp,
                color: Colors.black,
                fontWeight: FontWeight.w500)),
        headlineLarge: GoogleFonts.roboto(
          fontSize: 35.sp,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
        headlineMedium: GoogleFonts.roboto(
          fontSize: 28.sp,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
        headlineSmall: GoogleFonts.roboto(
          fontSize: 18.sp,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
      );
}


mixin CustomFontsDark {
  TextTheme makeInputTextTheme() => TextTheme(
        titleLarge: GoogleFonts.roboto(
            textStyle: TextStyle(
                fontSize: 40.sp,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
        titleMedium: GoogleFonts.roboto(
              textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 28.sp,
                  fontWeight: FontWeight.bold)),
        titleSmall: GoogleFonts.roboto(
              textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold)),
        bodyLarge: GoogleFonts.roboto(
          fontSize: 28.sp,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
        bodyMedium: GoogleFonts.roboto(
            textStyle: TextStyle(
                fontSize: 16.sp,
                color: Colors.white,
                fontWeight: FontWeight.w500)),
        bodySmall: GoogleFonts.roboto(
            textStyle: TextStyle(
                fontSize: 14.sp,
                color: Colors.white,
                fontWeight: FontWeight.w500)),
        headlineLarge: GoogleFonts.roboto(
          fontSize: 35.sp,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
        headlineMedium: GoogleFonts.roboto(
          fontSize: 28.sp,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
        headlineSmall: GoogleFonts.roboto(
          fontSize: 18.sp,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
      );
}