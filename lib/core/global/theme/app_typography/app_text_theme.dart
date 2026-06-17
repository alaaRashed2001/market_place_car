import 'package:flutter/material.dart';

class AppTextTheme {
  static TextTheme light = const TextTheme(
    // H1
    displayLarge: TextStyle(
      fontSize: 34,
      fontWeight: FontWeight.bold,
      height: 40 / 34,
    ),
    displayMedium: TextStyle(
      fontSize: 34,
      fontWeight: FontWeight.w400,
      height: 40 / 34,
    ),

    // H1 small
    displaySmall: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      height: 32 / 28,
    ),

    // H2
    headlineLarge: TextStyle(
      fontSize: 26,
      fontWeight: FontWeight.bold,
      height: 30 / 26,
    ),
    headlineMedium: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w900,
      height: 1.0,
    ),
    headlineSmall: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w400,
      height: 28 / 22,
    ),

    // Title
    titleLarge: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      height: 24 / 18,
    ),
    titleMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      height: 24 / 18,
    ),

    // Button
    labelLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      height: 24 / 16,
    ),
    labelMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      height: 24 / 16,
    ),

    // Input
    bodyLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      height: 24 / 16,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      height: 20 / 14,
    ),
    bodySmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      height: 20 / 14,
    ),
  );

  static TextTheme dark = light;
}
