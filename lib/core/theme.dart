import 'package:flutter/material.dart';
import 'package:ggamf_front/core/color.dart';
import 'package:google_fonts/google_fonts.dart';

TextTheme textTheme() {
  return TextTheme(
    headline1: GoogleFonts.hahmlet(fontSize: 18.0, color: Colors.black),
    headline2: GoogleFonts.hahmlet(
        fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.bold),
    headline3: GoogleFonts.hahmlet(
        fontSize: 24.0, color: Colors.black, fontWeight: FontWeight.bold),
    bodyText1: GoogleFonts.hahmlet(fontSize: 16.0, color: Colors.black),
    bodyText2: GoogleFonts.hahmlet(fontSize: 14.0, color: Colors.grey),
    subtitle1: GoogleFonts.hahmlet(fontSize: 15.0, color: Colors.black),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    centerTitle: false,
    color: kPrimaryColor,
    elevation: 0.0,
    titleTextStyle: textTheme().headline3,
  );
}

// ThemeData theme() {
//   return ThemeData(
//     scaffoldBackgroundColor: Colors.white,
//     textTheme: textTheme(),
//     appBarTheme: appBarTheme(),
//     bottomNavigationBarTheme: BottomNavigationBarThemeData(
//       selectedItemColor: Colors.black87,
//       unselectedItemColor: Colors.black38,
//     ),
//   );
// }

ThemeData theme() {
  return ThemeData(
    fontFamily: 'NanumSquare',
    backgroundColor: Color(0xFFFFFBFE),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(elevation: MaterialStatePropertyAll(0))),
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.white,
      titleTextStyle: TextStyle(fontSize: 25, color: Colors.black),
    ),
  );
}
