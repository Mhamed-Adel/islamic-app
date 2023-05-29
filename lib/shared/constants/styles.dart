import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class ColorApp {
  static const Color primary = Color(0xff49C649);
  static const Color offWhite = Color(0xffF8F8F8);
  static const Color green1 = Color(0xff49C649);
  static const Color green2 = Color(0xff336325);
  static const Color red = Color(0xffB42C2C);
  static const Color voilent = Color(0xff422563);
  static const Color yellow1 = Color(0xffFFD434);
}


TextStyle get headingStyle {
  return GoogleFonts.tajawal(
  textStyle: const TextStyle(
    color: ColorApp.offWhite,
    fontSize: 28,
    
    fontWeight: FontWeight.bold,
  )
  );
}
TextStyle get subHeadingStyle {
  return GoogleFonts.tajawal(
  textStyle: const TextStyle(
    color: ColorApp.green1,
    fontSize: 24,
    fontWeight: FontWeight.bold,
  )
  );
}