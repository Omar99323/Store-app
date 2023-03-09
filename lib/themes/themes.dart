// ignore_for_file: file_names
import 'package:flutter/material.dart';
import '../helpers/consts.dart';

ThemeData darkThemeData() {
  return ThemeData(
    textTheme: TextTheme(
      headlineMedium: TextStyle(
        color: maincolor,
      ),
      headlineSmall: TextStyle(
        color: white,
      ),
      bodyLarge: TextStyle(
        color: white,
      ),
    ),
    scaffoldBackgroundColor: dark,
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: dark,
      titleTextStyle: TextStyle(
        color: white,
      ),
      iconTheme: IconThemeData(
        color: white,
      ),
    ),
    fontFamily: 'Poppins',
    primarySwatch: maincolor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      backgroundColor: dark,
      selectedIconTheme: IconThemeData(
        color: maincolor,
      ),
      unselectedIconTheme: const IconThemeData(
        color: Colors.grey,
      ),
      selectedLabelStyle: TextStyle(
        color: maincolor,
      ),
      unselectedItemColor: white,
    ),
  );
}

ThemeData lightThemeData() {
  return ThemeData(
    textTheme: TextTheme(
      headlineMedium: TextStyle(
        color: maincolor,
      ),
      headlineSmall: TextStyle(
        color: dark,
      ),
      bodyLarge: const TextStyle(
        color: Colors.black,
      ),
    ),
    scaffoldBackgroundColor: white,
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: white,
      titleTextStyle: TextStyle(
        color: dark,
      ),
      iconTheme: IconThemeData(
        color: dark,
      ),
    ),
    fontFamily: 'Poppins',
    primarySwatch: maincolor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      backgroundColor: white,
      selectedIconTheme: IconThemeData(
        color: maincolor,
      ),
      unselectedIconTheme: const IconThemeData(
        color: Colors.grey,
      ),
      selectedLabelStyle: TextStyle(
        color: maincolor,
      ),
      unselectedItemColor: dark,
    ),
  );
}
