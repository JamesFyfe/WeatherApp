import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/providers/api_providers.dart';
import 'package:weather_app/utils/utils.dart';

import '../providers/location_provider.dart';

class WeatherView extends ConsumerWidget {
  const WeatherView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentCoordinates = ref.watch(locationProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('James\' Weather')),
      body: SafeArea(
        child: Center(
          child: currentCoordinates.when(
            data: (position) {
              final lat = position.latitude;
              final lon = position.longitude;

              final weatherDataAsync = ref.watch(weatherDataProvider(lat, lon));

              return weatherDataAsync.when(
                data: (weatherData) {
                  final cityName = weatherData['city']['name'];
                  final temperature = kelvinToFahrenheit(
                      weatherData['list'][0]['main']['temp']);
                  // Extract other relevant weather information

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('City: $cityName'),
                      Text('Temperature: $temperature'),
                      // Display other weather information
                    ],
                  );
                },
                loading: () => const CircularProgressIndicator(),
                error: (error, stackTrace) => Text('Error: $error'),
              );
            },
            loading: () => const CircularProgressIndicator(),
            error: (error, stackTrace) => Text('Error: $error'),
          ),
        ),
      ),
    );
  }
}
