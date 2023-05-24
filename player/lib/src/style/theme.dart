import 'package:flutter/material.dart';
import 'palette.dart';

final ThemeData theme = ThemeData(
  // Scaffold Background Color
  scaffoldBackgroundColor: Palette.white,

  // App Bar Theme
  appBarTheme: AppBarTheme(
    backgroundColor: Palette.background,
    elevation: 0,
    titleSpacing: 4.0,
    centerTitle: true,
  ),

  // Bottom Bar Theme
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Palette.background,
    selectedItemColor: Palette.red,
    unselectedItemColor: Palette.white,
  ),
);
