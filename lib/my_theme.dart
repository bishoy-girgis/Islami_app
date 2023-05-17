import 'package:flutter/material.dart';

class MyTheme {
  static const Color lightPrimary = Color(0XFFB7935F);
  static const Color darkPrimary = Color(0XFF141A2E);
  static const Color yellow = Color(0XFFFACC1D);

  static final ThemeData lightTheme = ThemeData(
      primaryColor: lightPrimary,
      accentColor: Colors.black,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
          color: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          )),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: lightPrimary,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedIconTheme: IconThemeData(color: Colors.black, size: 36),
        selectedLabelStyle: TextStyle(
          color: Colors.black,
        ),
        unselectedIconTheme: IconThemeData(color: Colors.white, size: 24),
        selectedItemColor: Colors.black,
      ),
      textTheme: const TextTheme(
        headlineMedium: TextStyle(fontSize: 30, color: Colors.black),
        bodyMedium: TextStyle(fontSize: 25, color: Colors.black),
        bodySmall: TextStyle(fontSize: 20, color: Colors.black),
      ));

  static final ThemeData Darktheme = ThemeData(
    primaryColor: darkPrimary,
    accentColor: yellow,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
        color: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        )),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: darkPrimary,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      selectedIconTheme: IconThemeData(color: yellow, size: 36),
      selectedLabelStyle: TextStyle(
        color: yellow,
      ),
      unselectedIconTheme: IconThemeData(color: Colors.white, size: 24),
      selectedItemColor: yellow,
    ),
    textTheme: const TextTheme(
      headlineMedium: TextStyle(fontSize: 30, color: Colors.white),
      bodyMedium: TextStyle(fontSize: 25, color: Colors.white),
      bodySmall: TextStyle(fontSize: 20, color: Colors.white),
    ),
  );
}
