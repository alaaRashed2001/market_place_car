import 'package:flutter/material.dart';
import 'package:market_place_car/core/global/theme/app_color/app_color_light.dart';
import 'package:market_place_car/core/global/theme/app_typography/app_text_theme.dart';

ThemeData getThemeDataLight() => ThemeData(
  brightness: Brightness.light,
  primaryColor: AppColorLight.primaryColor,
  scaffoldBackgroundColor: AppColorLight.backgroundColor,
  cardColor: AppColorLight.cardColor,
  dividerColor: AppColorLight.dividerColor,
  shadowColor: AppColorLight.shadowColor,

  // ColorScheme
  colorScheme: const ColorScheme.light(
    primary: AppColorLight.secondaryColor,
    secondary: AppColorLight.accentColor,
    surface: AppColorLight.surfaceColor,
    error: AppColorLight.errorColor,
    onPrimary: AppColorLight.textOnPrimaryColor,
    onSecondary: AppColorLight.textPrimaryColor,
    onSurface: AppColorLight.textPrimaryColor,
    onError: AppColorLight.textOnPrimaryColor,
  ),

  // AppBar Theme
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColorLight.appBarColor,
    foregroundColor: AppColorLight.appBarTitleColor,
    centerTitle: true,
    elevation: 0,
    iconTheme: IconThemeData(color: AppColorLight.appBarIconColor),
    titleTextStyle: TextStyle(
      color: AppColorLight.appBarTitleColor,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
  ),

  // Text Button Theme
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(foregroundColor: AppColorLight.primaryColor),
  ),

  // Elevated Button Theme
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColorLight.buttonPrimaryColor,
      disabledBackgroundColor: AppColorLight.buttonDisabledColor,
      foregroundColor: AppColorLight.textOnPrimaryColor,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w800,
        fontFamily: 'Avenir Arabic',
        height: 1.0,
      ),
    ),
  ),

  // Outlined Button Theme
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: AppColorLight.primaryColor,
      side: const BorderSide(color: AppColorLight.borderColor),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
    ),
  ),

  // Input Decoration Theme
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: AppColorLight.inputFillColor,
    hintStyle: const TextStyle(color: AppColorLight.textHintColor),
    labelStyle: const TextStyle(color: AppColorLight.textSecondaryColor),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColorLight.inputBorderColor),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColorLight.inputBorderColor),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        color: AppColorLight.inputFocusedBorderColor,
        width: 2,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColorLight.errorColor),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
  ),

  // Card Theme
  cardTheme: CardThemeData(
    color: AppColorLight.cardColor,
    elevation: 2,
    shadowColor: AppColorLight.shadowColor,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  ),

  // Bottom Navigation Bar Theme
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: AppColorLight.bottomNavBackgroundColor,
    selectedItemColor: AppColorLight.bottomNavActiveColor,
    unselectedItemColor: AppColorLight.bottomNavInactiveColor,
    type: BottomNavigationBarType.fixed,
    elevation: 8,
  ),

  // Icon Theme
  iconTheme: const IconThemeData(color: AppColorLight.iconPrimaryColor),

  // Divider Theme
  dividerTheme: const DividerThemeData(
    color: AppColorLight.dividerColor,
    thickness: 1,
  ),

  // Text Theme
  textTheme: AppTextTheme.light,
);
