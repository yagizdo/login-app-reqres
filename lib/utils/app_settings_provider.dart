import 'package:flutter/material.dart';

import '../models/app_settings/app_settings_model.dart';

class AppSettingsProvider extends ChangeNotifier {
  final AppSettings _settings = AppSettings();

  AppSettings get settings => _settings;

  void setKeyboardOpen(bool isOpen) {
    _settings.isKeyboardOpenState = isOpen;
    notifyListeners();
  }
}