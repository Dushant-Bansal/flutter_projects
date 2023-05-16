import 'package:flutter/material.dart';
import 'package:seat_finder/src/style/style.dart';

ThemeData theme = ThemeData(
  useMaterial3: true,
  textTheme: TextTheme(
    labelMedium: TextStyle(color: Palette.dBlue, fontSize: 20.0),
    bodySmall:
        TextStyle(color: Palette.dBlue, fontSize: 8.0, letterSpacing: -0.5),
    displaySmall: TextStyle(color: Palette.blue, fontWeight: FontWeight.bold),
    bodyMedium: TextStyle(color: Palette.blue, fontWeight: FontWeight.bold),
  ),
);
