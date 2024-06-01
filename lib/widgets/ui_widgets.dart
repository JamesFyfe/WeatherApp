import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/router/routes.dart';
import 'package:weather_app/utils/utils.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard(this.weatherData, {super.key});
  final dynamic weatherData;

  @override
  Widget build(BuildContext context) {
    final cityName = weatherData['name'];
    final temperature = kelvinToFahrenheit(weatherData['main']['temp']);
    final weather = weatherData['weather'][0]['main'];
    final weatherDescription = weatherData['weather'][0]['description'];
    final weatherIconId = weatherData['weather'][0]['icon'];
    final iconUrl = 'https://openweathermap.org/img/wn/$weatherIconId@2x.png';

    return InkWell(
      splashColor: Colors.grey.withAlpha(30),
      borderRadius: const BorderRadius.all(Radius.circular(12)),
      onTap: () {
        context.push(kWeatherDetailsRoute);
      },
      child: Ink(
        height: 96,
        decoration: const BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
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
                    style: Theme.of(context).textTheme.headlineSmall,
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
                      Text(capitalizeFirstLetter(weatherDescription)),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                temperature.toString(),
                style: Theme.of(context).textTheme.displayLarge,
              ),
            )
          ],
        ),
      ),
    );
  }
}
