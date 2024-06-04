import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/my_app.dart';
import 'package:weather_app/services/shared_prefs.dart';

Future<void> main(List<String> args) async {
  if (args.isNotEmpty) {
    dotenv.testLoad(fileInput: args.first);
  } else {
    await dotenv.load();
  }
  // await dotenv.load();
  final sharedPreferences = await SharedPreferences.getInstance();
  SharedPrefs().initialize(sharedPreferences);
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}
