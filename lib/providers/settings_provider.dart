import 'package:flutter/material.dart';
import 'package:test_api_flutter/entities/entities.dart';

class SettingsProvider extends ChangeNotifier {
  SettingsEntity settingsEntity = SettingsEntity();
  bool _isDarkMode = false;

  bool isLoading = false;

  set setDarkMode(bool value) {
    _isDarkMode = value;
    //isLoading = true;
    settingsEntity.setTheme = value;
    notifyListeners();
  }

  bool get getDarkMode {
    return _isDarkMode;
  }

  ThemeData getTheme() => settingsEntity.getThemeData;
}
