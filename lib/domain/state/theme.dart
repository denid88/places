import 'package:flutter/material.dart';
import 'package:places/domain/interactor/settings_interactor.dart';
import 'package:places/ui/res/enums.dart';
import 'package:places/ui/utils/theme_utils.dart';

class ThemeModel extends ChangeNotifier {

  final SettingsInteractor settingsInteractor;

  ThemeModel({required this.settingsInteractor});

  ThemeMode _mode = ThemeMode.light;

  ThemeMode get mode => _mode;

  void initTheme() async {
    final ThemeMode mode = await settingsInteractor.getThemeMode();
    if (mode == ThemeMode.light) {
      _mode = ThemeMode.light;
    } else if (mode == ThemeMode.dark) {
      _mode = ThemeMode.dark;
    }
    notifyListeners();
  }

  void changeTheme(ThemeMode value) async {
    settingsInteractor.changeThemeMode(converterEnumThemeToString(value))
    .then((_) {
      _mode = value;
      notifyListeners();
    }).catchError((e) {print('Something went wrong with change theme $e');});

  }
}