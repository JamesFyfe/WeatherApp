import 'package:geolocator/geolocator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_app/classes/coordinates.dart';
import 'package:weather_app/services/shared_prefs.dart';

part 'location_provider.g.dart';

@riverpod
class Location extends _$Location {
  @override
  Coordinates? build() {
    // return last known position until new one is determined
    _determinePosition();
    return SharedPrefs().lastKnownLocation;
  }

  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.',
      );
    }
    Position pos = await Geolocator.getCurrentPosition();
    state = Coordinates(latitude: pos.latitude, longitude: pos.longitude);
  }
}
