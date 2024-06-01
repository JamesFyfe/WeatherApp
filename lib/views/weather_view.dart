import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/constants/constants.dart';
import 'package:weather_app/providers/api_providers.dart';
import 'package:weather_app/providers/app_providers.dart';
import 'package:weather_app/widgets/ui_widgets.dart';

import '../providers/location_provider.dart';

class WeatherView extends ConsumerWidget {
  const WeatherView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentCoordinates = ref.watch(locationProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('James\' Weather')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              currentCoordinates.when(
                data: (coords) {
                  final currentLat = coords.latitude;
                  final currentLon = coords.longitude;

                  final currentWeatherDataAsync = ref.watch(weatherDataProvider(
                      currentLat, currentLon, kCurrentWeatherApiUrl));

                  return currentWeatherDataAsync.when(
                    data: (currentWeatherData) {
                      return WeatherCard(currentWeatherData);
                    },
                    loading: () => const Center(
                      child: Column(
                        children: [
                          Text('Waiting for weather data...'),
                          CircularProgressIndicator(),
                        ],
                      ),
                    ),
                    error: (error, stackTrace) =>
                        Text('Error getting weather data: $error'),
                  );
                },
                loading: () => const Center(
                  child: Column(
                    children: [
                      Text('Waiting for location data...'),
                      CircularProgressIndicator(),
                    ],
                  ),
                ),
                error: (error, stackTrace) =>
                    Text('Error getting location data: $error'),
              ),
              ElevatedButton(
                onPressed: () {
                  ref.read(selectedThemeProvider.notifier).toggleTheme();
                },
                child: const Icon(Icons.brightness_6),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
