import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/router/go_router.dart';
import 'package:weather_app/providers/app_providers.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTheme = ref.watch(selectedThemeProvider);

    return MaterialApp.router(
      title: "Flutter Weather App",
      debugShowCheckedModeBanner: false,
      theme: selectedTheme,
      routerConfig: router,
    );
  }
}
