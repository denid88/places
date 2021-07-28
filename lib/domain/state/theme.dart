import 'package:flutter/material.dart';

class ThemeModel extends ChangeNotifier {

  ThemeMode _mode = ThemeMode.light;

  ThemeMode get mode => _mode;

  void changeTheme(ThemeMode value) {
    _mode = value;
    notifyListeners();
  }
}