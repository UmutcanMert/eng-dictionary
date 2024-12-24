import 'package:flutter/material.dart';
import 'package:flutter_application_1/themes/themes_pages.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;

  // Use a setter method with a custom name
  void setThemeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == lightMode) {
      setThemeData(darkMode); 
    } else {
      setThemeData(lightMode);
    }
  }
}
