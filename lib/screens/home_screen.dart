import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/providers/app_providers.dart';
import 'package:weather_app/providers/location_provider.dart';
import 'package:weather_app/widgets/app_bar.dart';
import 'package:weather_app/widgets/search_bar.dart';
import 'package:weather_app/widgets/weather_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar('James\' Weather'),
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
                    child: ListView(
                      children: [
                        // Current location weatherCard
                        Consumer(
                          builder: (context, ref, child) {
                            final currentCoordinates =
                                ref.watch(locationProvider);
                            return currentCoordinates != null
                                ? WeatherCard(currentCoordinates,
                                    closable: false,
                                    overwriteTimeText: "Current Location")
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
                                  .map((location) => WeatherCard(location))
                                  .toList(),
                            );
                          },
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
