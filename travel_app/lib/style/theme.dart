import 'package:flutter/material.dart';

ThemeData theme = ThemeData(
  useMaterial3: true,
  fontFamily: 'Montserrat',
  textTheme: const TextTheme(
    // Carousel Description Style
    headlineLarge: TextStyle(
      color: Colors.white,
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      letterSpacing: -1,
    ),

    headlineSmall: TextStyle(
      color: Colors.white,
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
    ),

    // Body Style
    bodyMedium: TextStyle(
      color: Color(0xFF8D8B8B),
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
    ),

    // Bullet Point Style
    titleMedium: TextStyle(
      color: Color(0xFF6A6767),
      fontSize: 14.0,
      fontWeight: FontWeight.w600,
    ),

    // Medium Heading
    displayMedium: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
  ),
);
