import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/classes/coordinates.dart';
import 'package:weather_app/providers/app_providers.dart';
import 'package:weather_app/providers/location_provider.dart';
import 'package:weather_app/services/shared_prefs.dart';
import 'package:weather_app/widgets/ui_widgets.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('James\' Weather')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Consumer(
                builder: (context, ref, child) {
                  final currentCoordinates = ref.watch(locationProvider);
                  return currentCoordinates != null
                      ? WeatherCard(currentCoordinates)
                      : const EmptyWeatherCard(
                          'Loading current coords... Last known location is null');
                },
              ),
              Expanded(
                child: ListView(
                  children: SharedPrefs()
                      .savedLocations
                      .map((location) => WeatherCard(location))
                      .toList(),
                ),
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
