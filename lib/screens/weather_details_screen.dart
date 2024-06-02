import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/providers/app_providers.dart';
import 'package:weather_app/widgets/app_bar.dart';

class WeatherDetailsScreen extends ConsumerWidget {
  const WeatherDetailsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: MyAppBar('Weather details'),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [Text("Details")],
          ),
        ),
      ),
    );
  }
}
