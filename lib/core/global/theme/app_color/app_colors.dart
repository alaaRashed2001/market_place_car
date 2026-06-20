import 'package:flutter/material.dart';

abstract class AppColors {
  final Color primaryColor;
  final Color backgroundColor;
  final Color cardColor;
  final Color appBarColor;
  final Color appBarIconColor;
  final Color appBarTitleColor;
  final Color bottomNavBackgroundColor;
  final Color bottomNavActiveColor;
  final Color bottomNavInactiveColor;
  final Color inputFillColor;
  final Color inputBorderColor;
  final Color inputErrorBorderColor;
  final Color inputFocusedBorderColor;
  final Color bottomSheetBackgroundColor;
  final Color bottomSheetHandleColor;
  final Color bottomSheetShadowColor;
  final Color activeDotColor;
  final Color inactiveDotColor;
  final Color textPrimaryColor;
  final Color buttonBackgroundColor;
  final Color buttonTextColor;
  final Color dangerButtonColor;
  final Color successColor;
  final Color errorColor;
  final Color snackBarTextColor;
  const AppColors({
    required this.primaryColor,
    required this.backgroundColor,
    required this.cardColor,
    required this.appBarColor,
    required this.appBarIconColor,
    required this.appBarTitleColor,
    required this.bottomNavBackgroundColor,
    required this.bottomNavActiveColor,
    required this.bottomNavInactiveColor,
    required this.inputFillColor,
    required this.inputBorderColor,
    required this.inputFocusedBorderColor,
    required this.inputErrorBorderColor,
    required this.bottomSheetBackgroundColor,
    required this.bottomSheetHandleColor,
    required this.bottomSheetShadowColor,



    required this.activeDotColor,
    required this.inactiveDotColor,
    required this.textPrimaryColor,
    required this.buttonBackgroundColor,
    required this.buttonTextColor,
    required this.dangerButtonColor,
    required this.successColor,
    required this.errorColor,
    required this.snackBarTextColor,
  });
}

class AppColorLight extends AppColors {
  const AppColorLight()
      : super(
    primaryColor: const Color(0xFF0F0F1A),
    backgroundColor: const Color(0xFFF8F9FA),
    cardColor: const Color(0xFFFFFFFF),
    appBarColor: const Color(0xFFF8F9FA),
    appBarIconColor: const Color(0xFF0F0F1A),
    appBarTitleColor: const Color(0xFF0F0F1A),
    bottomNavBackgroundColor: const Color(0xFFFFFFFF),
    bottomNavActiveColor: const Color(0xFF000000),
    bottomNavInactiveColor: const Color(0xFF6B7280),
    inputFillColor: const Color(0xFFF9FAFB),
    inputBorderColor: const Color(0xFFFFFFFF),
    inputFocusedBorderColor: const Color(0xFF45BB6F),
    inputErrorBorderColor: const Color(0xFFEF4444),
    bottomSheetBackgroundColor: const Color(0xFFFFFFFF),
    bottomSheetHandleColor: const Color(0xFF9CA3AF),
    bottomSheetShadowColor: const Color(0x14000000),
    activeDotColor: const Color(0xFF000000),
    inactiveDotColor: const Color(0xFFB2B2B2),
    textPrimaryColor: const Color(0xFF000000),
    buttonBackgroundColor: const Color(0xFF000000),
    buttonTextColor: const Color(0xFFFFFFFF),
    dangerButtonColor: const Color(0xFF93000F),
    successColor: const Color(0xFF10B981),
    errorColor: const Color(0xFFEF4444),
    snackBarTextColor: const Color(0xFFFFFFFF),
  );
}

class AppColorDark extends AppColors {
  const AppColorDark()
      : super(
    primaryColor: const Color(0xFFFFFFFF),
    backgroundColor: const Color(0xFF000000),
    cardColor: const Color(0xFF16213E),
    appBarColor: const Color(0xFF0F0F1A),
    appBarIconColor: const Color(0xFFFFFFFF),
    appBarTitleColor: const Color(0xFFFFFFFF),
    bottomNavBackgroundColor: const Color(0xFF1A1A2E),
    bottomNavActiveColor: const Color(0xFFFFFFFF),
    bottomNavInactiveColor: const Color(0xFF6B7280),
    inputFillColor: const Color(0xFF1A1A2E),
    inputBorderColor: const Color(0xFF1A1A2E),
    inputFocusedBorderColor: const Color(0xFF45BB6F),
    inputErrorBorderColor: const Color(0xFFEF4444),
    bottomSheetBackgroundColor: const Color(0xFF121214),
    bottomSheetHandleColor: const Color(0xFF6B7280),
    bottomSheetShadowColor: const Color(0x33000000),
    activeDotColor: const Color(0xFFFFFFFF),
    inactiveDotColor: const Color(0xFF4B5563),
    textPrimaryColor: const Color(0xFFFFFFFF),
    buttonBackgroundColor: const Color(0xFFFFFFFF),
    buttonTextColor: const Color(0xFF000000),
    dangerButtonColor: const Color(0xFF93000F),
    successColor: const Color(0xFF059669),
    errorColor: const Color(0xFFDC2626),
    snackBarTextColor: const Color(0xFFFFFFFF),
  );
}