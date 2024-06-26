import 'dart:convert';

class Coordinates {
  final double latitude;
  final double longitude;

  Coordinates({required this.latitude, required this.longitude});

  Map<String, double> toMap() {
    return {'latitude': latitude, 'longitude': longitude};
  }

  static String encode(List<Coordinates> coordsList) => json.encode(
        coordsList
            .map<Map<String, double>>((coords) => coords.toMap())
            .toList(),
      );

  static List<Coordinates> decode(String coordsString) {
    if (coordsString == '') {
      return [];
    }
    List<dynamic> jsonList = json.decode(coordsString);

    List<Coordinates> latitudes = jsonList.map((item) {
      return Coordinates(
          latitude: item['latitude'] as double,
          longitude: item['longitude'] as double);
    }).toList();
    return latitudes;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is Coordinates &&
        other.latitude == latitude &&
        other.longitude == longitude;
  }

  @override
  int get hashCode => Object.hash(latitude, longitude);

  @override
  String toString() {
    return 'Coordinates{latitude: $latitude, longitude: $longitude}';
  }
}
