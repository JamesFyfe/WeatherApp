import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/classes/daily_data.dart';
import 'package:weather_app/classes/hourly_data.dart';
import 'package:weather_app/providers/app_providers.dart';
import 'package:weather_app/utils/utils.dart';

class HourlyWeatherCard extends ConsumerWidget {
  const HourlyWeatherCard(this.data, {super.key});
  final HourlyData data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tempUnit = ref.watch(selectedUnitProvider);
    final temp = tempUnit == 'F'
        ? kelvinToFahrenheit(data.tempK)
        : kelvinToCelsius(data.tempK);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Column(
        children: [
          Text(
            DateFormat('ha').format(data.time),
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(color: Colors.white),
          ),
          Image.network(
            data.iconUrl,
            width: 32,
            height: 32,
            fit: BoxFit.contain,
          ),
          Text(
            '${temp.toString()}°',
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class DailyWeatherCard extends ConsumerWidget {
  const DailyWeatherCard(this.data, {super.key});
  final DailyData data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tempUnit = ref.watch(selectedUnitProvider);
    final tempHigh = tempUnit == 'F'
        ? kelvinToFahrenheit(data.tempHighK)
        : kelvinToCelsius(data.tempHighK);
    final tempLow = tempUnit == 'F'
        ? kelvinToFahrenheit(data.tempLowK)
        : kelvinToCelsius(data.tempLowK);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              data.day,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: Colors.white),
            ),
          ),
          Image.network(
            data.iconUrl,
            width: 40,
            height: 40,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 50),
          Text(
            'Low ${tempLow.toString()}°',
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Colors.white),
          ),
          const SizedBox(width: 30),
          Text(
            'High ${tempHigh.toString()}°',
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
