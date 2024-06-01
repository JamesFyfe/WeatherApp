import 'package:flutter/material.dart';

class Themes {
  static const kColorPrimary = Color.fromARGB(255, 53, 202, 212);
  static const kColorPrimaryDark = Color.fromARGB(255, 6, 26, 28);

  static final lightTheme = ThemeData.light();
  static final darkTheme = ThemeData.dark();

  // static final lightTheme = ThemeData(
  //   brightness: Brightness.light,
  //   useMaterial3: true,
  //   fontFamily: "Roboto",
  //   appBarTheme: AppBarTheme(
  //     backgroundColor: Colors.grey.shade100,
  //     iconTheme: const IconThemeData(color: kColorPrimary),
  //     centerTitle: true,
  //   ),
  //   colorScheme: ColorScheme.fromSeed(seedColor: kColorPrimary),
  //   elevatedButtonTheme: ElevatedButtonThemeData(
  //     style: ElevatedButton.styleFrom(
  //       foregroundColor: Colors.white,
  //       backgroundColor: kColorPrimary,
  //       elevation: 0,
  //       padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
  //     ),
  //   ),
  //   iconTheme: const IconThemeData(color: kColorPrimary),
  //   cardTheme: const CardTheme(
  //     margin: EdgeInsets.all(0),
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.all(
  //         Radius.circular(15),
  //       ),
  //     ),
  //   ),
  // );

  // static final darkTheme = ThemeData(
  //   brightness: Brightness.dark,
  //   useMaterial3: true,
  //   fontFamily: "Roboto",
  //   appBarTheme: AppBarTheme(
  //     backgroundColor: Colors.grey.shade800,
  //     iconTheme: const IconThemeData(color: kColorPrimaryDark),
  //     centerTitle: true,
  //   ),
  //   colorScheme: ColorScheme.fromSeed(seedColor: kColorPrimaryDark),
  //   elevatedButtonTheme: ElevatedButtonThemeData(
  //     style: ElevatedButton.styleFrom(
  //       foregroundColor: Colors.black,
  //       backgroundColor: kColorPrimaryDark,
  //       elevation: 0,
  //       padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
  //     ),
  //   ),
  //   iconTheme: const IconThemeData(color: kColorPrimaryDark),
  //   cardTheme: const CardTheme(
  //     margin: EdgeInsets.all(0),
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.all(
  //         Radius.circular(15),
  //       ),
  //     ),
  //   ),
  // );
}
