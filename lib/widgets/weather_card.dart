import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/classes/coordinates.dart';
import 'package:weather_app/providers/app_providers.dart';
import 'package:weather_app/providers/weather_api_providers.dart';
import 'package:weather_app/router/routes.dart';
import 'package:weather_app/utils/utils.dart';

class WeatherCard extends ConsumerWidget {
  const WeatherCard(this.coordinates,
      {this.closable = true, this.overwriteTimeText, super.key});
  final Coordinates coordinates;
  final bool closable;
  final String? overwriteTimeText;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherDataAsync = ref.watch(currentWeatherDataProvider(
      coordinates.latitude,
      coordinates.longitude,
    ));
    final tempUnit = ref.watch(selectedUnitProvider);

    return weatherDataAsync.when(
      data: (weatherData) {
        String cityName = weatherData['name'];
        if (cityName.length > 16) {
          cityName = '${cityName.substring(0, 13)}...';
        }
        final temperature = tempUnit == 'F'
            ? kelvinToFahrenheit(weatherData['main']['temp'].toDouble())
            : kelvinToCelsius(weatherData['main']['temp'].toDouble());
        // final weather = weatherData['weather'][0]['main'];
        final timeOffset = (weatherData['timezone']);
        final weatherDescription = weatherData['weather'][0]['description'];
        final weatherIconId = weatherData['weather'][0]['icon'];
        final iconUrl =
            'https://openweathermap.org/img/wn/$weatherIconId@2x.png';

        // all timestamps in seconds
        final sunriseTime = (weatherData['sys']['sunrise']);
        final sunsetTime = (weatherData['sys']['sunset']);

        final nowTimeStamp = DateTime.now().millisecondsSinceEpoch ~/ 1000;
        final isDayTime =
            nowTimeStamp > sunriseTime && nowTimeStamp < sunsetTime;

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: InkWell(
            splashColor: Colors.grey.withAlpha(30),
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            onTap: () {
              context.push(kWeatherDetailsRoute, extra: weatherData);
            },
            child: Ink(
              height: 100,
              decoration: BoxDecoration(
                color: isDayTime
                    ? const Color.fromARGB(255, 93, 138, 174)
                    : const Color.fromARGB(255, 35, 48, 81),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8, left: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cityName,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(color: Colors.white),
                        ),
                        Consumer(
                          builder: (context, ref, child) {
                            final utcTime = ref.watch(utcTimeProvider).value;
                            final localTime = utcToLocal(utcTime, timeOffset);
                            return Text(
                              overwriteTimeText ?? localTime,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(color: Colors.white),
                            );
                          },
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
                        padding: const EdgeInsets.symmetric(vertical: 8),
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
                        child: closable
                            ? SizedBox(
                                width: 48,
                                child: IconButton(
                                  icon: const Icon(Icons.close,
                                      color: Colors.white),
                                  onPressed: () {
                                    ref
                                        .read(savedLocationsProvider.notifier)
                                        .removeLocation(coordinates);
                                  },
                                ),
                              )
                            : const SizedBox(width: 48),
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        splashColor: Colors.grey.withAlpha(30),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
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
