import 'package:flutter/material.dart';
import 'package:places/domain/interactor/settings_interactor.dart';
import 'package:places/domain/repository/settings_repository.dart';

class SettingsInteractorImpl extends SettingsInteractor {
  final SettingsRepository settingsRepository;

  SettingsInteractorImpl({required this.settingsRepository});

  @override
  Future<void> changeThemeMode(String themeMode) async {
    settingsRepository.changeThemeMode(themeMode);
  }

  @override
  Future<ThemeMode> getThemeMode() {
    return settingsRepository.getThemeMode();
  }
  
}