import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_app/constants/constants.dart';

part 'weather_api_providers.g.dart';

@riverpod
class CurrentWeatherData extends _$CurrentWeatherData {
  @override
  FutureOr<Map<String, dynamic>> build(
      double latitude, double longitude) async {
    final apiKey = dotenv.env['OPEN_WEATHER_MAP_API_KEY'];
    final dio = Dio();

    try {
      final response = await dio.get(
        kCurrentWeatherApiUrl,
        queryParameters: {
          'lat': latitude,
          'lon': longitude,
          'appid': apiKey,
        },
      );

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception("${response.statusCode}: ${response.statusMessage}");
      }
    } catch (error) {
      throw Exception('Failed to fetch weather data: $error');
    }
  }
}

@riverpod
class FiveDayWeatherData extends _$FiveDayWeatherData {
  @override
  FutureOr<Map<String, dynamic>> build(
      double latitude, double longitude) async {
    final apiKey = dotenv.env['OPEN_WEATHER_MAP_API_KEY'];
    final dio = Dio();

    try {
      final response = await dio.get(
        kFiveDayWeatherApiUrl,
        queryParameters: {
          'lat': latitude,
          'lon': longitude,
          'appid': apiKey,
        },
      );

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception("${response.statusCode}: ${response.statusMessage}");
      }
    } catch (error) {
      print("ERROR getting 5 day data");
      throw Exception('Failed to fetch weather data: $error');
    }
  }
}

@riverpod
class CitySearch extends _$CitySearch {
  @override
  FutureOr<List<dynamic>?> build(String cityName) async {
    if (cityName == '') {
      return null;
    }
    final apiKey = dotenv.env['OPEN_WEATHER_MAP_API_KEY'];
    final dio = Dio();
    print("Searching $cityName...");

    try {
      final response = await dio.get(
        kGeocodingApiUrl,
        queryParameters: {
          'q': cityName,
          'limit': 10,
          'appid': apiKey,
        },
      );

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception("${response.statusCode}: ${response.statusMessage}");
      }
    } catch (error) {
      throw Exception('Failed to fetch geocode data: $error');
    }
  }
}

@riverpod
class SearchQuery extends _$SearchQuery {
  @override
  String build() {
    return '';
  }

  void setQuery(String query) {
    state = query;
  }
}

@riverpod
class ShowSearch extends _$ShowSearch {
  @override
  bool build() {
    return false;
  }

  void set(bool show) {
    state = show;
  }
}
