import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/classes/coordinates.dart';
import 'package:weather_app/services/shared_prefs.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('SharedPrefs', () {
    SharedPreferences.setMockInitialValues({});
    late SharedPreferences sharedPreferences;
    late SharedPrefs sharedPrefs;

    setUp(() async {
      sharedPreferences = await SharedPreferences.getInstance();
      sharedPrefs = SharedPrefs();
      sharedPrefs.initialize(sharedPreferences);
    });

    test('getDarkMode and darkMode', () {
      expect(sharedPrefs.darkMode, false);

      sharedPrefs.darkMode = true;
      expect(sharedPrefs.darkMode, true);

      sharedPrefs.darkMode = false;
      expect(sharedPrefs.darkMode, false);
    });

    test('getLastKnownLocation and lastKnownLocation', () {
      expect(sharedPrefs.lastKnownLocation, null);

      final coords = Coordinates(latitude: 37.7749, longitude: -122.4194);
      sharedPrefs.lastKnownLocation = coords;
      expect(sharedPrefs.lastKnownLocation, coords);
    });

    test('getSavedLocations, addSavedLocation, and removeSavedLocation', () {
      expect(sharedPrefs.savedLocations, []);

      final coords1 = Coordinates(latitude: 37.7749, longitude: -122.4194);
      final coords2 = Coordinates(latitude: 40.7128, longitude: -74.0060);

      sharedPrefs.addSavedLocation(coords1);
      expect(sharedPrefs.savedLocations, [coords1]);

      sharedPrefs.addSavedLocation(coords2);
      expect(sharedPrefs.savedLocations, [coords1, coords2]);

      sharedPrefs.removeSavedLocation(coords1);
      expect(sharedPrefs.savedLocations, [coords2]);

      sharedPrefs.removeSavedLocation(coords2);
      expect(sharedPrefs.savedLocations, []);
    });
  });
}
