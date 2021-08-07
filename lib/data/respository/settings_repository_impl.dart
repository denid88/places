import 'package:flutter/material.dart';
import 'package:places/domain/repository/settings_repository.dart';
import 'package:places/ui/utils/theme_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsRepositoryImpl extends SettingsRepository {

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  static String settingsKey = 'settingsKey';

  @override
  Future<void> changeThemeMode(String themeMode) async {
    final prefs = await _prefs;
    await prefs.setString(settingsKey, themeMode);
  }

  @override
  Future<ThemeMode> getThemeMode() async {
    final prefs = await _prefs;
    return convertStringThemeToEnum(prefs.getString(settingsKey));
  }

}