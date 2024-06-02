import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/router/routes.dart';
import 'package:weather_app/screens/index.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: kHomeRoute,
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
    ),
    GoRoute(
      path: kWeatherDetailsRoute,
      builder: (BuildContext context, GoRouterState state) {
        return const WeatherDetailsScreen();
      },
    ),
    GoRoute(
      path: kSettingsRoute,
      builder: (BuildContext context, GoRouterState state) {
        return const SettingsScreen();
      },
    ),
  ],
);
