import 'package:flutter/material.dart';

class SettingsEntity {
  ThemeData _themeData = ThemeData.light();
  set setTheme(bool isDarkMode) {
    if (isDarkMode) {
      _themeData = ThemeData.dark().copyWith(
        errorColor: Colors.red,
        primaryColor: Colors.blue,
        textTheme: const TextTheme(
            button: TextStyle(color: Colors.white),
            caption: TextStyle(color: Colors.white),
            headline3: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16)),
        iconTheme: const IconThemeData(color: Colors.white),
      );
    } else {
      _themeData = ThemeData.light().copyWith();
    }
  }

  ThemeData get getThemeData => _themeData;
}
