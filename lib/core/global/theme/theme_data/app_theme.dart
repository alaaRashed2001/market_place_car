import 'package:flutter/material.dart';
import 'package:market_place_car/core/global/theme/app_color/app_colors.dart';
import 'package:market_place_car/core/global/theme/font_weight/font_weight_helper.dart';

class AppTheme {
  static const AppColors darkColors = AppColorDark();
  static const AppColors lightColors = AppColorLight();

  static const String _defaultFont = 'AvenirArabic';

  static TextStyle _style({
    required double fontSize,
    required FontWeight fontWeight,
    required double lineHeight,
    required Color textColor,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: textColor,
      fontFamily: _defaultFont,
      height: lineHeight / fontSize,
    );
  }

  static TextTheme _buildTextTheme({required Color textColor}) {
    TextStyle create(double size, FontWeight weight, double figmaLineHeight) {
      return _style(
        fontSize: size,
        fontWeight: weight,
        lineHeight: figmaLineHeight / size,
        textColor: textColor,
      );
    }

    return TextTheme(
      displayLarge: create(34, FontWeightHelper.bold, 40),
      displayMedium: create(34, FontWeightHelper.regular, 40),

      displaySmall: create(28, FontWeightHelper.bold, 32),
      headlineLarge: create(28, FontWeightHelper.regular, 32),

      headlineMedium: create(26, FontWeightHelper.bold, 30),
      headlineSmall: create(26, FontWeightHelper.regular, 30),

      titleLarge: create(22, FontWeightHelper.bold, 28),
      titleMedium: create(22, FontWeightHelper.regular, 28),

      titleSmall: create(18, FontWeightHelper.bold, 24),
      bodyLarge: create(18, FontWeightHelper.regular, 24),

      bodyMedium: create(16, FontWeightHelper.bold, 24),
      bodySmall: create(16, FontWeightHelper.regular, 24),

      labelLarge: create(14, FontWeightHelper.bold, 20),
      labelMedium: create(14, FontWeightHelper.regular, 20),
    );
  }

  static BottomNavigationBarThemeData _getBottomNavTheme({
    required Color backgroundColor,
    required Color activeColor,
    required Color inactiveColor,
  }) {
    return BottomNavigationBarThemeData(
      backgroundColor: backgroundColor,
      selectedItemColor: activeColor,
      unselectedItemColor: inactiveColor,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      selectedLabelStyle: _style(
        fontSize: 12,
        fontWeight: FontWeight.w900,
        lineHeight: 12,
        textColor: activeColor,
      ),
      unselectedLabelStyle: _style(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        lineHeight: 12,
        textColor: inactiveColor,
      ),
      selectedIconTheme: const IconThemeData(size: 24),
      unselectedIconTheme: const IconThemeData(size: 24),
    );
  }

  // (Dark Theme)
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      fontFamily: _defaultFont,
      primaryColor: darkColors.primaryColor,
      scaffoldBackgroundColor: darkColors.backgroundColor,
      cardColor: darkColors.cardColor,
      textTheme: _buildTextTheme(textColor: darkColors.textPrimaryColor),
      appBarTheme: AppBarTheme(
        backgroundColor: darkColors.appBarColor,
        iconTheme: IconThemeData(color: darkColors.appBarIconColor),
        titleTextStyle: _style(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          lineHeight: 24,
          textColor: darkColors.appBarTitleColor,
        ),
        elevation: 0,
      ),

      colorScheme: const ColorScheme.dark().copyWith(
        primary: darkColors.activeDotColor,
        surfaceContainerHighest: darkColors.inactiveDotColor,
      ),
      bottomNavigationBarTheme: _getBottomNavTheme(
        backgroundColor: darkColors.bottomNavBackgroundColor,
        activeColor: darkColors.bottomNavActiveColor,
        inactiveColor: darkColors.bottomNavInactiveColor,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: darkColors.inputFillColor,
        isDense: true,
        contentPadding: const EdgeInsets.all(16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: darkColors.inputBorderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: darkColors.inputBorderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: darkColors.inputFocusedBorderColor,
            width: 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: darkColors.inputErrorBorderColor),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: darkColors.inputErrorBorderColor),
        ),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: darkColors.bottomSheetBackgroundColor,
        modalBackgroundColor: darkColors.bottomSheetBackgroundColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        elevation: 0,
      ),
    );
  }

  // (Light Theme)
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      fontFamily: _defaultFont,
      primaryColor: lightColors.primaryColor,
      scaffoldBackgroundColor: lightColors.backgroundColor,
      cardColor: lightColors.cardColor,
      textTheme: _buildTextTheme(textColor: lightColors.textPrimaryColor),
      appBarTheme: AppBarTheme(
        backgroundColor: lightColors.appBarColor,
        iconTheme: IconThemeData(color: lightColors.appBarIconColor),
        titleTextStyle: _style(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          lineHeight: 24,
          textColor: lightColors.appBarTitleColor,
        ),
        elevation: 0,
      ),

      colorScheme: const ColorScheme.light().copyWith(
        primary: lightColors.activeDotColor,
        surfaceContainerHighest: lightColors.inactiveDotColor,
      ),
      bottomNavigationBarTheme: _getBottomNavTheme(
        backgroundColor: lightColors.bottomNavBackgroundColor,
        activeColor: lightColors.bottomNavActiveColor,
        inactiveColor: lightColors.bottomNavInactiveColor,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: lightColors.cardColor,
        isDense: true,
        contentPadding: const EdgeInsets.all(16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: lightColors.inputBorderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: lightColors.inputBorderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: lightColors.inputFocusedBorderColor,
            width: 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: lightColors.inputErrorBorderColor),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: lightColors.inputErrorBorderColor),
        ),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: lightColors.bottomSheetBackgroundColor,
        modalBackgroundColor: lightColors.bottomSheetBackgroundColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        elevation: 0,
      ),
    );
  }
}
