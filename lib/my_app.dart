import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/providers/app_providers.dart';
import 'package:weather_app/views/weather_view.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTheme = ref.watch(selectedThemeProvider);

    return MaterialApp(
      title: "Flutter Weather App",
      debugShowCheckedModeBanner: false,
      home: const WeatherView(),
      theme: selectedTheme,
    );
  }
}
