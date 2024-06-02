import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/classes/coordinates.dart';
import 'package:weather_app/providers/app_providers.dart';
import 'package:weather_app/providers/weather_api_providers.dart';
import 'package:weather_app/router/routes.dart';
import 'package:weather_app/utils/utils.dart';

class WeatherCard extends ConsumerWidget {
  const WeatherCard(this.coordinates, {super.key});
  final Coordinates coordinates;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherDataAsync = ref.watch(currentWeatherDataProvider(
      coordinates.latitude,
      coordinates.longitude,
    ));

    return weatherDataAsync.when(
      data: (weatherData) {
        final cityName = weatherData['name'];
        final temperature = kelvinToFahrenheit(weatherData['main']['temp']);
        final weather = weatherData['weather'][0]['main'];
        final weatherDescription = weatherData['weather'][0]['description'];
        final weatherIconId = weatherData['weather'][0]['icon'];
        final iconUrl =
            'https://openweathermap.org/img/wn/$weatherIconId@2x.png';

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: InkWell(
            splashColor: Colors.grey.withAlpha(30),
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            onTap: () {
              context.push(kWeatherDetailsRoute);
            },
            child: Ink(
              height: 96,
              decoration: const BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16, left: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cityName,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(color: Colors.white),
                        ),
                        Row(
                          children: [
                            Image.network(
                              iconUrl,
                              width: 40,
                              height: 40,
                              fit: BoxFit.contain,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              capitalizeFirstLetter(weatherDescription),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 16, 0, 16),
                        child: Text(
                          '${temperature.toString()}°',
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge
                              ?.copyWith(color: Colors.white),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          icon: const Icon(Icons.close, color: Colors.white),
                          onPressed: () {
                            ref
                                .read(savedLocationsProvider.notifier)
                                .removeLocation(coordinates);
                          },
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
      loading: () => const EmptyWeatherCard("Loading weather data..."),
      error: (error, stackTrace) {
        print('ERROR GETTING CURRENT WEATHER: $error');
        return EmptyWeatherCard("Error: $error");
      },
    );
  }
}

class EmptyWeatherCard extends ConsumerWidget {
  const EmptyWeatherCard(this.message, {super.key});
  final String message;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("EMPTY WEATHER CARD");
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        splashColor: Colors.grey.withAlpha(30),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        onTap: () {
          context.push(kWeatherDetailsRoute);
        },
        child: Ink(
          height: 96,
          decoration: const BoxDecoration(
            color: Colors.blueGrey,
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16, left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      message,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(color: Colors.white),
                    ),
                    Text(
                      '--',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  '--',
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge
                      ?.copyWith(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
