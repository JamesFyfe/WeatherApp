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
        throw Exception('Failed to fetch weather data');
      }
    } catch (error) {
      throw Exception('Failed to fetch weather data: $error');
    }
  }
}