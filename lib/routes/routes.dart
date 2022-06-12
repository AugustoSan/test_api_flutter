import 'package:flutter/material.dart';
import 'package:test_api_flutter/screens/screens.dart';

class RouteManager {
  static RouteSettings settings = const RouteSettings(name: '/home');
  static const String homeScreen = '/home';
  static const String resultScreen = '/result';
  static const String settingsScreen = '/settings';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case resultScreen:
        return MaterialPageRoute(builder: (_) => const ResultScreen());
      case settingsScreen:
        return MaterialPageRoute(builder: (_) => const SettingsScreen());
      default:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
    }
  }
}
