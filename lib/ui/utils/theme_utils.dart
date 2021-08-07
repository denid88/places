import 'package:flutter/material.dart';

String converterEnumThemeToString(ThemeMode themeMode) {
  if (themeMode == ThemeMode.light) return 'light';
  if (themeMode == ThemeMode.dark) return 'dark';
  return 'unknown';
}

ThemeMode convertStringThemeToEnum(String? themeMode) {
  if (themeMode == 'light') return ThemeMode.light;
  if (themeMode == 'dark') return ThemeMode.dark;
  return ThemeMode.light;
}