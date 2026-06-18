import 'package:flutter/material.dart';
import 'package:market_place_car/core/global/theme/app_color/app_colors.dart';

class AppTheme {
  static const AppColors darkColors = AppColorDark();
  static const AppColors lightColors = AppColorLight();

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: darkColors.primaryColor,
      scaffoldBackgroundColor: darkColors.backgroundColor,
      cardColor: darkColors.cardColor,
      dividerColor: darkColors.dividerColor,

      // ثيم الـ AppBar
      appBarTheme: AppBarTheme(
        backgroundColor: darkColors.appBarColor,
        iconTheme: IconThemeData(color: darkColors.appBarIconColor),
        titleTextStyle: TextStyle(color: darkColors.appBarTitleColor, fontSize: 20, fontWeight: FontWeight.bold),
        elevation: 0,
      ),

      // ثيم النصوص
      textTheme: TextTheme(
        bodyLarge: TextStyle(color: darkColors.textPrimaryColor),
        bodyMedium: TextStyle(color: darkColors.textSecondaryColor),
      ),

      // ثيم الأزرار
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: darkColors.buttonPrimaryColor,
          foregroundColor: darkColors.textOnPrimaryColor,
        ),
      ),

      // ثيم الـ Bottom Navigation Bar
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: darkColors.bottomNavBackgroundColor,
        selectedItemColor: darkColors.bottomNavActiveColor,
        unselectedItemColor: darkColors.bottomNavInactiveColor,
      ),

      // ثيم حقول الإدخال (TextField)
      inputDecorationTheme: InputDecorationTheme(
        fillColor: darkColors.inputFillColor,
        filled: true,
        border: OutlineInputBorder(borderSide: BorderSide(color: darkColors.inputBorderColor)),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: darkColors.inputFocusedBorderColor)),
      ),
    );
  }

  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: lightColors.primaryColor,
      scaffoldBackgroundColor: lightColors.backgroundColor,
      cardColor: lightColors.cardColor,
      dividerColor: lightColors.dividerColor,

      appBarTheme: AppBarTheme(
        backgroundColor: lightColors.appBarColor,
        iconTheme: IconThemeData(color: lightColors.appBarIconColor),
        titleTextStyle: TextStyle(color: lightColors.appBarTitleColor, fontSize: 20, fontWeight: FontWeight.bold),
        elevation: 0,
      ),

      textTheme: TextTheme(
        bodyLarge: TextStyle(color: lightColors.textPrimaryColor),
        bodyMedium: TextStyle(color: lightColors.textSecondaryColor),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: lightColors.buttonPrimaryColor,
          foregroundColor: lightColors.textOnPrimaryColor,
        ),
      ),

      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: lightColors.bottomNavBackgroundColor,
        selectedItemColor: lightColors.bottomNavActiveColor,
        unselectedItemColor: lightColors.bottomNavInactiveColor,
      ),

      inputDecorationTheme: InputDecorationTheme(
        fillColor: lightColors.inputFillColor,
        filled: true,
        border: OutlineInputBorder(borderSide: BorderSide(color: lightColors.inputBorderColor)),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: lightColors.inputFocusedBorderColor)),
      ),
    );
  }
}