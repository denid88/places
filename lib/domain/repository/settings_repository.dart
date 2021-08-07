import 'package:flutter/material.dart';

abstract class SettingsRepository {
  Future<void> changeThemeMode(String themeMode);
  Future<ThemeMode> getThemeMode();
}