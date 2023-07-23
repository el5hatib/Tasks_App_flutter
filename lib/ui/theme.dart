import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

const Color bluishClr = Color(0xFF4e5ae8);
const Color orangeClr = Color(0xCFFF8746);
const Color pinkClr = Color(0xFFff4667);
const Color greyblueClr = Color(0xFFc9d1d9);
const Color tealClr= Color(0xFF00b5ad);
const Color purbleCLr = Color(0xFF6f42c1);
const Color white = Colors.white;
const primaryClr = bluishClr;
const Color darkGreyClr = Color(0xFF121212);
const Color darkHeaderClr = Color(0xFF424242);

class Themes {
  static final light = ThemeData(
    primaryColor: primaryClr,
    brightness: Brightness.light, // provide light theme.
  );
  static final dark = ThemeData(
    primaryColor: darkGreyClr,
    brightness: Brightness.dark, // provide dark theme.
  );

  TextStyle get headingStyle => GoogleFonts.lato(
        textStyle: TextStyle(
          color: Get.isDarkMode ? Colors.white : Colors.black,
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
        ),
      );
  TextStyle get subHeadingStyle => GoogleFonts.lato(
    textStyle: TextStyle(
      color: Get.isDarkMode ? Colors.white : Colors.black,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
  );
TextStyle get titleStyle => GoogleFonts.lato(
    textStyle: TextStyle(
      color: Get.isDarkMode ? Colors.white : Colors.black,
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
    ),
  );
  TextStyle get subTitleStyle => GoogleFonts.lato(
    textStyle: TextStyle(
      color: Colors.grey,
      fontSize: 14.0,
      fontWeight: FontWeight.bold,
    ),
  );
  TextStyle get bodyStyle => GoogleFonts.lato(
    textStyle: TextStyle(
      color: Get.isDarkMode ? Colors.white : Colors.black,
      fontSize: 12.0,
      fontWeight: FontWeight.bold,
    ),
  );
  TextStyle get bodyLightStyle => GoogleFonts.lato(
    textStyle: TextStyle(
      color: Get.isDarkMode ? Colors.grey[200] : Colors.black,
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
    ),
  );
  List<Color> colors = [
    bluishClr,
    orangeClr,
    pinkClr,
    greyblueClr,
    tealClr ,
    purbleCLr
  ];


}
