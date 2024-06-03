import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_app/classes/coordinates.dart';
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

@riverpod
class SavedLocations extends _$SavedLocations {
  @override
  List<Coordinates> build() {
    return SharedPrefs().savedLocations;
  }

  void addLocation(Coordinates coords) {
    SharedPrefs().addSavedLocation(coords);
    state = SharedPrefs().savedLocations;
  }

  void removeLocation(Coordinates coords) {
    SharedPrefs().removeSavedLocation(coords);
    state = SharedPrefs().savedLocations;
  }
}

@riverpod
class SelectedUnit extends _$SelectedUnit {
  @override
  String build() {
    return SharedPrefs().unit;
  }

  void setFarenheit() {
    SharedPrefs().unit = 'F';
    state = 'F';
  }

  void setCelsius() {
    SharedPrefs().unit = 'C';
    state = 'C';
  }
}

@riverpod
Stream<DateTime> utcTime(UtcTimeRef ref) {
  // emit a new value only when the second is 0
  return Stream.periodic(
    const Duration(seconds: 1),
    (_) => DateTime.now().toUtc(),
  ).where((time) => time.second == 0);
}
