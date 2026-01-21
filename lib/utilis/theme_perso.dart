import 'package:flutter/material.dart';

abstract class ThemePerso {
  static final ThemeData modeClair = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.pink,
      brightness: Brightness.light,
    ),
    useMaterial3: true,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.pink,
      foregroundColor: Colors.white,
      centerTitle: true,
    ),
  );
  static final ThemeData modeSombre = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.purple,
      brightness: Brightness.dark,
    ),
    useMaterial3: true,
    appBarTheme: AppBarTheme(backgroundColor: Colors.purple, centerTitle: true),
  );
}
