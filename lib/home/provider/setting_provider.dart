import 'package:flutter/material.dart';

class SettingProvider extends ChangeNotifier {
  ThemeMode currentTheme = ThemeMode.light;
  String currentLocal = "en";

  void changeTheme(ThemeMode newMode) {
    if (newMode == currentTheme) return;

    currentTheme = newMode;
    notifyListeners();
  }

  bool isDark() {
    return currentTheme == ThemeMode.dark;
  }

  String getMainBackground() {
    return currentTheme == ThemeMode.dark
        ? "assets/images/main_background_dark.png"
        : "assets/images/main_background.png";
  }

  String getThemeName() {
    return currentTheme == ThemeMode.dark ? "Dark" : "Light";
  }

  void changeLocal(String newLocal) {
    if (newLocal == currentLocal) return;
    currentLocal = newLocal;
    notifyListeners();
  }

  String getSplashScreen() {
    return currentTheme == ThemeMode.dark
        ? "assets/images/splash_dark.png"
        : "assets/images/splash.png";
  }
}
