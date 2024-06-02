import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/router/routes.dart';
import 'package:weather_app/widgets/settings_button.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String titleName;

  @override
  final Size preferredSize;

  const MyAppBar(this.titleName, {Key? key})
      : preferredSize = const Size.fromHeight(72.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(titleName),
      elevation: 0,
      leadingWidth: 72,
      actions: const [
        SettingsButton(),
      ],
    );
  }
}
