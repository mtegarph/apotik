import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supercharged/supercharged.dart';

class ColorStyle {
  static final primaryColor = "1A998E".toColor();
  static final secondaryColor = "A7D397".toColor();
  static final successColor = "23AC00".toColor();
  static final warnigColor = "F5BF00".toColor();
  static const whiteColor = Colors.white;
  static final blackFontColor = "F5BF00".toColor();
}

ThemeData theme() {
  return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: appBarTheme(),
      useMaterial3: true);
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
      color: ColorStyle.primaryColor,
      elevation: 0,
      centerTitle: true,
      iconTheme: const IconThemeData(color: Color(0XFF8B8B8B)),
      titleTextStyle: const TextStyle(color: Color(0XFF8B8B8B), fontSize: 18));
}

TextStyle headlineStyleText() {
  return GoogleFonts.poppins(fontSize: 18, color: "4D4D4D".toColor());
}

TextStyle titleStyleText() {
  return GoogleFonts.poppins(fontSize: 13, color: "1F1717".toColor());
}
