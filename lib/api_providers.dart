import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'constants.dart';

part 'api_providers.g.dart';

@riverpod
String helloWorld(HelloWorldRef ref) {
  return 'Hello world';
}

@riverpod
class WeatherData extends _$WeatherData {
  @override
  FutureOr<Map<String, dynamic>> build(
      double latitude, double longitude) async {
    const apiKey = kOpenWeatherMapApiKey;
    final dio = Dio();

    try {
      final response = await dio.get(
        'https://api.openweathermap.org/data/2.5/forecast',
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
