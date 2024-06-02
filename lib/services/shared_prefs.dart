import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/classes/coordinates.dart';
import 'package:weather_app/constants/constants.dart';

class SharedPrefs {
  static SharedPrefs? _instance;
  late SharedPreferences _prefs;

  SharedPrefs._();

  factory SharedPrefs() {
    _instance ??= SharedPrefs._();
    return _instance!;
  }

  void initialize(SharedPreferences prefs) {
    _prefs = prefs;
  }

  dynamic _getData(String key) {
    var value = _prefs.get(key);
    return value;
  }

  Future<void> _saveData(String key, dynamic value) async {
    if (value is String) {
      await _prefs.setString(key, value);
    } else if (value is int) {
      await _prefs.setInt(key, value);
    } else if (value is double) {
      await _prefs.setDouble(key, value);
    } else if (value is bool) {
      await _prefs.setBool(key, value);
    } else if (value is List<String>) {
      await _prefs.setStringList(key, value);
    }
  }

  bool get darkMode => _getData(kDarkMode) ?? false;

  set darkMode(bool value) => _saveData(kDarkMode, value);

  Coordinates? get lastKnownLocation =>
      Coordinates.decode(_getData(kLastKnownLocation) ?? '').firstOrNull;

  set lastKnownLocation(Coordinates? coords) => _saveData(
      kLastKnownLocation, coords == null ? null : Coordinates.encode([coords]));

  List<Coordinates> get savedLocations =>
      Coordinates.decode(_getData(kSavedLocations) ?? '');

  set savedLocations(List<Coordinates> locations) =>
      _saveData(kSavedLocations, Coordinates.encode(locations));

  void addSavedLocation(Coordinates coords) {
    final newSavedLocations = savedLocations;
    newSavedLocations.add(coords);
    savedLocations = newSavedLocations;
  }

  void removeSavedLocation(Coordinates coords) {
    final newSavedLocations = savedLocations;
    newSavedLocations.remove(coords);
    savedLocations = newSavedLocations;
  }
}
