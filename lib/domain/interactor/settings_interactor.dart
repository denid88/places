import 'package:flutter/material.dart';

abstract class SettingsInteractor {
  Future<ThemeMode> getThemeMode();
  Future<void> changeThemeMode(String themeMode);
}