import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_app/services/shared_prefs.dart';
import 'package:weather_app/themes.dart';

part 'app_providers.g.dart';

@riverpod
class SelectedTheme extends _$SelectedTheme {
  @override
  ThemeData build() {
    return SharedPrefs().darkMode ? Themes.darkTheme : Themes.lightTheme;
  }

  void toggleTheme() {
    SharedPrefs().darkMode = !SharedPrefs().darkMode;
    state = SharedPrefs().darkMode ? Themes.darkTheme : Themes.lightTheme;
  }
}
