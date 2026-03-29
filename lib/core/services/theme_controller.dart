import 'package:flutter/material.dart';
import 'package:fruits_market/constants.dart';
import 'package:fruits_market/core/services/shared_preferences.dart';

class ThemeController extends ChangeNotifier {
  ThemeController._();

  static final ThemeController instance = ThemeController._();

  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;
  bool get isDarkMode => _themeMode == ThemeMode.dark;

  void loadTheme() {
    _themeMode = Prefs.getBool(kIsDarkMode) ? ThemeMode.dark : ThemeMode.light;
  }

  void toggleTheme() {
    _themeMode = isDarkMode ? ThemeMode.light : ThemeMode.dark;
    Prefs.setBool(kIsDarkMode, isDarkMode);
    notifyListeners();
  }
}
