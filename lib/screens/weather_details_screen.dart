import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/classes/daily_data.dart';
import 'package:weather_app/classes/hourly_data.dart';
import 'package:weather_app/providers/app_providers.dart';
import 'package:weather_app/providers/weather_api_providers.dart';
import 'package:weather_app/utils/utils.dart';
import 'package:weather_app/widgets/app_bar.dart';
import 'package:weather_app/widgets/ui_widgets.dart';

class WeatherDetailsScreen extends ConsumerWidget {
  const WeatherDetailsScreen(this.currentData, {super.key});
  final Map<String, dynamic> currentData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherDataAsync = ref.watch(fiveDayWeatherDataProvider(
      currentData['coord']['lat'],
      currentData['coord']['lon'],
    ));
    return Scaffold(
      appBar: const MyAppBar('Weather details'),
      body: weatherDataAsync.when(
        data: (fiveDayWeatherData) {
          return LoadedPage(fiveDayWeatherData, currentData);
        },
        loading: () {
          return const Text("Loading...");
        },
        error: (Object error, StackTrace stackTrace) {
          return const Text("Error");
        },
      ),
    );
  }
}

class LoadedPage extends ConsumerWidget {
  const LoadedPage(this.fiveDayWeatherData, this.currentData, {super.key});
  final Map<String, dynamic> fiveDayWeatherData;
  final Map<String, dynamic> currentData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tempUnit = ref.watch(selectedUnitProvider);

    final cityName = currentData['name'];
    final currentTemp = tempUnit == 'F'
        ? kelvinToFahrenheit(currentData['main']['temp'].toDouble())
        : kelvinToCelsius(currentData['main']['temp'].toDouble());
    final currentDescription = currentData['weather'][0]['description'];
    final currentWeatherIconId = currentData['weather'][0]['icon'];
    final currentIconUrl =
        'https://openweathermap.org/img/wn/$currentWeatherIconId@2x.png';

    final sunriseTime = (currentData['sys']['sunrise']);
    final sunsetTime = (currentData['sys']['sunset']);

    final nowTimeStamp = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    final isDayTime = nowTimeStamp > sunriseTime && nowTimeStamp < sunsetTime;

    final List<HourlyData> hourlyDataList = [];
    for (var data in fiveDayWeatherData['list']) {
      hourlyDataList.add(HourlyData.jsonToHourlyData(data));
    }

    final List dailyDataList = DailyData.hourlyToDailyData(hourlyDataList);

    return SizedBox.expand(
      child: Container(
        color: isDayTime
            ? const Color.fromARGB(255, 93, 138, 174)
            : const Color.fromARGB(255, 35, 48, 81),
        child: ListView(
          children: [
            Column(
              children: [
                const SizedBox(height: 24),
                Text(
                  cityName,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(color: Colors.white),
                ),
                Text(
                  '${currentTemp.toString()}°',
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge
                      ?.copyWith(color: Colors.white, fontSize: 72),
                ),
                Text(
                  currentDescription,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: Colors.white),
                ),
                const SizedBox(height: 32),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                height: 92,
                decoration: const BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Row(
                      children: hourlyDataList
                          .sublist(0, 15)
                          .map((data) => HourlyWeatherCard(data))
                          .toList(),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: Column(
                  children: dailyDataList
                      .map((data) => DailyWeatherCard(data))
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
