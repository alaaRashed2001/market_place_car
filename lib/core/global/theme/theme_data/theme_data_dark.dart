import 'package:flutter/material.dart';
import 'package:market_place_car/core/global/theme/app_color/app_color_dark.dart';

ThemeData getThemeDataDark() => ThemeData(
  brightness: Brightness.dark,
  primaryColor: AppColorDark.primaryColor,
  scaffoldBackgroundColor: AppColorDark.backgroundColor,
  cardColor: AppColorDark.cardColor,
  dividerColor: AppColorDark.dividerColor,
  shadowColor: AppColorDark.shadowColor,

  // ColorScheme
  colorScheme: const ColorScheme.dark(
    primary: AppColorDark.secondaryColor,
    secondary: AppColorDark.accentColor,
    surface: AppColorDark.surfaceColor,
    error: AppColorDark.errorColor,
    onPrimary: AppColorDark.textOnPrimaryColor,
    onSecondary: AppColorDark.textPrimaryColor,
    onSurface: AppColorDark.textPrimaryColor,
    onError: AppColorDark.textPrimaryColor,
  ),

  // AppBar Theme
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColorDark.appBarColor,
    foregroundColor: AppColorDark.appBarTitleColor,
    centerTitle: true,
    elevation: 0,
    iconTheme: IconThemeData(color: AppColorDark.appBarIconColor),
    titleTextStyle: TextStyle(
      color: AppColorDark.appBarTitleColor,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
  ),

  // Text Button Theme
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColorDark.primaryColor,
    ),
  ),

  // Elevated Button Theme
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColorDark.buttonPrimaryColor,
      foregroundColor: AppColorDark.textPrimaryColor,
      disabledBackgroundColor: AppColorDark.buttonDisabledColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
      textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    ),
  ),

  // Outlined Button Theme
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: AppColorDark.primaryColor,
      side: const BorderSide(color: AppColorDark.borderColor),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
    ),
  ),

  // Input Decoration Theme
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: AppColorDark.inputFillColor,
    hintStyle: const TextStyle(color: AppColorDark.textHintColor),
    labelStyle: const TextStyle(color: AppColorDark.textSecondaryColor),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColorDark.inputBorderColor),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColorDark.inputBorderColor),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
          color: AppColorDark.inputFocusedBorderColor, width: 2),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColorDark.errorColor),
    ),
    contentPadding:
    const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
  ),

  // Card Theme
  cardTheme: CardThemeData(
    color: AppColorDark.cardColor,
    elevation: 4,
    shadowColor: AppColorDark.shadowColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
  ),

  // Bottom Navigation Bar Theme
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: AppColorDark.bottomNavBackgroundColor,
    selectedItemColor: AppColorDark.bottomNavActiveColor,
    unselectedItemColor: AppColorDark.bottomNavInactiveColor,
    type: BottomNavigationBarType.fixed,
    elevation: 8,
  ),

  // Icon Theme
  iconTheme: const IconThemeData(
    color: AppColorDark.iconPrimaryColor,
  ),

  // Divider Theme
  dividerTheme: const DividerThemeData(
    color: AppColorDark.dividerColor,
    thickness: 1,
  ),

  // Text Theme
  textTheme: const TextTheme(
    displayLarge: TextStyle(
        color: AppColorDark.textPrimaryColor,
        fontWeight: FontWeight.bold,
        fontSize: 32),
    displayMedium: TextStyle(
        color: AppColorDark.textPrimaryColor,
        fontWeight: FontWeight.bold,
        fontSize: 28),
    displaySmall: TextStyle(
        color: AppColorDark.textPrimaryColor,
        fontWeight: FontWeight.bold,
        fontSize: 24),
    headlineMedium: TextStyle(
        color: AppColorDark.textPrimaryColor,
        fontWeight: FontWeight.w600,
        fontSize: 20),
    headlineSmall: TextStyle(
        color: AppColorDark.textPrimaryColor,
        fontWeight: FontWeight.w600,
        fontSize: 18),
    titleLarge: TextStyle(
        color: AppColorDark.textPrimaryColor,
        fontWeight: FontWeight.w600,
        fontSize: 16),
    titleMedium: TextStyle(
        color: AppColorDark.textSecondaryColor, fontSize: 14),
    bodyLarge: TextStyle(
        color: AppColorDark.textPrimaryColor, fontSize: 16),
    bodyMedium: TextStyle(
        color: AppColorDark.textSecondaryColor, fontSize: 14),
    bodySmall: TextStyle(
        color: AppColorDark.textHintColor, fontSize: 12),
  ),
);