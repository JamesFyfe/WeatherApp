import 'package:test/test.dart';
import 'package:weather_app/classes/coordinates.dart';

void main() {
  group('Coordinates', () {
    test('toMap returns a map representation of Coordinates', () {
      final coordinates = Coordinates(latitude: 37.7749, longitude: -122.4194);
      final mapData = coordinates.toMap();

      expect(mapData, equals({'latitude': 37.7749, 'longitude': -122.4194}));
    });

    test('encode encodes a list of Coordinates to JSON string', () {
      final coordsList = [
        Coordinates(latitude: 37.7749, longitude: -122.4194),
        Coordinates(latitude: 40.7128, longitude: -74.006),
      ];
      final encodedString = Coordinates.encode(coordsList);

      expect(
          encodedString,
          equals(
              '[{"latitude":37.7749,"longitude":-122.4194},{"latitude":40.7128,"longitude":-74.006}]'));
    });

    test('decode decodes a JSON string to a list of Coordinates', () {
      const jsonString =
          '[{"latitude":37.7749,"longitude":-122.4194},{"latitude":40.7128,"longitude":-74.006}]';
      final decodedList = Coordinates.decode(jsonString);

      expect(decodedList.length, equals(2));
      expect(decodedList[0].latitude, equals(37.7749));
      expect(decodedList[0].longitude, equals(-122.4194));
      expect(decodedList[1].latitude, equals(40.7128));
      expect(decodedList[1].longitude, equals(-74.006));
    });

    test('decode returns an empty list for an empty JSON string', () {
      const emptyJsonString = '';
      final decodedList = Coordinates.decode(emptyJsonString);

      expect(decodedList, isEmpty);
    });

    test('toString returns the correct string representation', () {
      final coordinates = Coordinates(latitude: 37.7749, longitude: -122.4194);
      final stringRepresentation = coordinates.toString();

      expect(stringRepresentation,
          equals('Coordinates{latitude: 37.7749, longitude: -122.4194}'));
    });
  });
}
