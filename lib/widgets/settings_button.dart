import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/providers/app_providers.dart';
import 'package:weather_app/services/shared_prefs.dart';

class SettingsButton extends ConsumerWidget {
  const SettingsButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: PopupMenuButton<String>(
        icon: const Icon(Icons.settings),
        offset: const Offset(0, 48),
        onSelected: (value) {
          switch (value) {
            case 'Fahrenheit':
              ref.read(selectedUnitProvider.notifier).setFarenheit();
              break;
            case 'Celsius':
              ref.read(selectedUnitProvider.notifier).setCelsius();
              break;
            case 'Dark Mode':
              ref.read(selectedThemeProvider.notifier).toggleTheme();
              break;
          }
        },
        itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
          CheckedPopupMenuItem<String>(
            value: 'Fahrenheit',
            checked: SharedPrefs().unit == "F",
            child: const Text('Fahrenheit'),
          ),
          CheckedPopupMenuItem<String>(
            value: 'Celsius',
            checked: SharedPrefs().unit == "C",
            child: const Text('Celsius'),
          ),
          CheckedPopupMenuItem<String>(
            value: 'Dark Mode',
            checked: SharedPrefs().darkMode,
            child: const Text('Dark Mode'),
          ),
        ],
      ),
    );
  }
}
