// ignore_for_file: file_names
import 'package:flutter/material.dart';
import '../helpers/consts.dart';

ThemeData darkThemeData() {
  return ThemeData(
    textTheme: TextTheme(
      headlineMedium: TextStyle(
        color: maincolor,
      ),
      bodyLarge: const TextStyle(
        color: Colors.white,
      ),
    ),
    scaffoldBackgroundColor: dark,
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: dark,
    ),
    fontFamily: 'Poppins',
    primarySwatch: maincolor,
  );
}

ThemeData lightThemeData() {
  return ThemeData(
    textTheme: TextTheme(
      headlineMedium: TextStyle(
        color: maincolor,
      ),
      bodyLarge: const TextStyle(
        color: Colors.black,
      ),
    ),
    scaffoldBackgroundColor: white,
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: white,
    ),
    fontFamily: 'Poppins',
    primarySwatch: maincolor,
  );
}
