import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/themes.dart';

part 'app_providers.g.dart';

@riverpod
SharedPreferences sharedPreferences(SharedPreferencesRef ref) {
  throw UnimplementedError();
}

@riverpod
class SelectedTheme extends _$SelectedTheme {
  @override
  ThemeData build() {
    final prefs = ref.watch(sharedPreferencesProvider);
    var darkMode = prefs.getBool('darkMode');
    if (darkMode == null) {
      darkMode = false;
      prefs.setBool('darkMode', false);
    }
    return darkMode ? Themes.darkTheme : Themes.lightTheme;
  }

  void toggleTheme() {
    final prefs = ref.watch(sharedPreferencesProvider);
    final newDarkMode = !prefs.getBool('darkMode')!;
    prefs.setBool('darkMode', newDarkMode);
    state = newDarkMode ? Themes.darkTheme : Themes.lightTheme;
  }
}
