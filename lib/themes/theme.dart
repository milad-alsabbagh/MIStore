import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
        background: Colors.grey.shade300,
        primary: Colors.grey.shade200,
        secondary: Colors.grey.shade100,
        inversePrimary: Colors.grey.shade700));

ThemeData darKTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
        background: Colors.blueGrey.shade800,
        primary: Colors.blueGrey.shade700,
        secondary: Colors.blueGrey.shade600,
        inversePrimary: Colors.blueGrey.shade300));
