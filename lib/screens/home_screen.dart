import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/providers/app_providers.dart';
import 'package:weather_app/providers/location_provider.dart';
import 'package:weather_app/services/shared_prefs.dart';
import 'package:weather_app/widgets/search_bar.dart';
import 'package:weather_app/widgets/ui_widgets.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('James\' Weather')),
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(24.0),
              child: CitySearchBar(),
            ),
            Expanded(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView(
                            children: [
                              // Current location weatherCard
                              Consumer(
                                builder: (context, ref, child) {
                                  final currentCoordinates =
                                      ref.watch(locationProvider);
                                  return currentCoordinates != null
                                      ? WeatherCard(currentCoordinates)
                                      : const EmptyWeatherCard(
                                          'Loading current coords... Last known location is null');
                                },
                              ),
                              // Saved location weatherCards
                              Consumer(
                                builder: (context, ref, child) {
                                  final savedLocations =
                                      ref.watch(savedLocationsProvider);
                                  return Column(
                                    children: savedLocations
                                        .map(
                                            (location) => WeatherCard(location))
                                        .toList(),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            ref
                                .read(selectedThemeProvider.notifier)
                                .toggleTheme();
                          },
                          child: const Icon(Icons.brightness_6),
                        ),
                      ],
                    ),
                  ),
                  const CitySearchResults(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
