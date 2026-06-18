import 'package:flutter/material.dart';

class AppColorLight extends AppColors {
  const AppColorLight() : super(
    primaryColor: const Color(0xFF0F0F1A),
    secondaryColor: const Color(0xFFE94560),
    accentColor: const Color(0xFFF5A623),
    backgroundColor: const Color(0xFFF8F9FA), // خلفية فاتحة
    surfaceColor: const Color(0xFFFFFFFF),
    cardColor: const Color(0xFFFFFFFF),
    appBarColor: const Color(0xFFFFFFFF),
    appBarIconColor: const Color(0xFF0F0F1A),
    appBarTitleColor: const Color(0xFF0F0F1A),
    textPrimaryColor: const Color(0xFF1F2937), // نصوص غامقة
    textSecondaryColor: const Color(0xFF4B5563),
    textHintColor: const Color(0xFF9CA3AF),
    textOnPrimaryColor: const Color(0xFFFFFFFF),
    buttonPrimaryColor: const Color(0xFFE94560),
    buttonSecondaryColor: const Color(0xFFE5E7EB),
    buttonDisabledColor: const Color(0xFFD1D5DB),
    borderColor: const Color(0xFFE5E7EB),
    dividerColor: const Color(0xFFE5E7EB),
    iconPrimaryColor: const Color(0xFF1F2937),
    iconSecondaryColor: const Color(0xFF4B5563),
    iconActiveColor: const Color(0xFFE94560),
    successColor: const Color(0xFF10B981),
    errorColor: const Color(0xFFEF4444),
    warningColor: const Color(0xFFF59E0B),
    infoColor: const Color(0xFF3B82F6),
    priceColor: const Color(0xFFE94560),
    badgeColor: const Color(0xFFE94560),
    favoriteActiveColor: const Color(0xFFE94560),
    favoriteInactiveColor: const Color(0xFF9CA3AF),
    tagBackgroundColor: const Color(0xFFF3F4F6),
    tagTextColor: const Color(0xFF1F2937),
    bottomNavBackgroundColor: const Color(0xFFFFFFFF),
    bottomNavActiveColor: const Color(0xFFE94560),
    bottomNavInactiveColor: const Color(0xFF9CA3AF),
    inputFillColor: const Color(0xFFF9FAFB),
    inputBorderColor: const Color(0xFFE5E7EB),
    inputFocusedBorderColor: const Color(0xFFE94560),
    shadowColor: const Color(0x10000000), // ظل أخف للـ light
  );
}
class AppColorDark extends AppColors {

  const AppColorDark() : super(
    primaryColor: const Color(0xFFFFFFFF),
    secondaryColor: const Color(0xFFE94560),
    accentColor: const Color(0xFFF5A623),
    backgroundColor: const Color(0xFF000000),
    surfaceColor: const Color(0xFF1A1A2E),
    cardColor: const Color(0xFF16213E),
    appBarColor: const Color(0xFF0F0F1A),
    appBarIconColor: const Color(0xFFFFFFFF),
    appBarTitleColor: const Color(0xFFFFFFFF),
    textPrimaryColor: const Color(0xFFFFFFFF),
    textSecondaryColor: const Color(0xFF9CA3AF),
    textHintColor: const Color(0xFF6B7280),
    textOnPrimaryColor: const Color(0xFF0F0F1A),
    buttonPrimaryColor: const Color(0xFFE94560),
    buttonSecondaryColor: const Color(0xFF374151),
    buttonDisabledColor: const Color(0xFF374151),
    borderColor: const Color(0xFF2D2D44),
    dividerColor: const Color(0xFF2D2D44),
    iconPrimaryColor: const Color(0xFFFFFFFF),
    iconSecondaryColor: const Color(0xFF9CA3AF),
    iconActiveColor: const Color(0xFFE94560),
    successColor: const Color(0xFF10B981),
    errorColor: const Color(0xFFEF4444),
    warningColor: const Color(0xFFF59E0B),
    infoColor: const Color(0xFF3B82F6),
    priceColor: const Color(0xFFE94560),
    badgeColor: const Color(0xFFE94560),
    favoriteActiveColor: const Color(0xFFE94560),
    favoriteInactiveColor: const Color(0xFF4B5563),
    tagBackgroundColor: const Color(0xFF2D2D44),
    tagTextColor: const Color(0xFFD1D5DB),
    bottomNavBackgroundColor: const Color(0xFF1A1A2E),
    bottomNavActiveColor: const Color(0xFFE94560),
    bottomNavInactiveColor: const Color(0xFF6B7280),
    inputFillColor: const Color(0xFF1A1A2E),
    inputBorderColor: const Color(0xFF2D2D44),
    inputFocusedBorderColor: const Color(0xFFE94560),
    shadowColor: const Color(0x40000000),
  );
}
abstract class AppColors {
  // Primary Colors
  final Color primaryColor;
  final Color secondaryColor;
  final Color accentColor;

  // Background Colors
  final Color backgroundColor;
  final Color surfaceColor;
  final Color cardColor;

  // AppBar
  final Color appBarColor;
  final Color appBarIconColor;
  final Color appBarTitleColor;

  // Text Colors
  final Color textPrimaryColor;
  final Color textSecondaryColor;
  final Color textHintColor;
  final Color textOnPrimaryColor;

  // Button Colors
  final Color buttonPrimaryColor;
  final Color buttonSecondaryColor;
  final Color buttonDisabledColor;

  // Border & Divider Colors
  final Color borderColor;
  final Color dividerColor;

  // Icon Colors
  final Color iconPrimaryColor;
  final Color iconSecondaryColor;
  final Color iconActiveColor;

  // Status Colors
  final Color successColor;
  final Color errorColor;
  final Color warningColor;
  final Color infoColor;

  // Car Card Specific
  final Color priceColor;
  final Color badgeColor;
  final Color favoriteActiveColor;
  final Color favoriteInactiveColor;
  final Color tagBackgroundColor;
  final Color tagTextColor;

  // Bottom Navigation
  final Color bottomNavBackgroundColor;
  final Color bottomNavActiveColor;
  final Color bottomNavInactiveColor;

  // Input Fields
  final Color inputFillColor;
  final Color inputBorderColor;
  final Color inputFocusedBorderColor;

  // Shadow
  final Color shadowColor;

  // Constructor مع جعل كل القيم Required
  const AppColors({
    required this.primaryColor,
    required this.secondaryColor,
    required this.accentColor,
    required this.backgroundColor,
    required this.surfaceColor,
    required this.cardColor,
    required this.appBarColor,
    required this.appBarIconColor,
    required this.appBarTitleColor,
    required this.textPrimaryColor,
    required this.textSecondaryColor,
    required this.textHintColor,
    required this.textOnPrimaryColor,
    required this.buttonPrimaryColor,
    required this.buttonSecondaryColor,
    required this.buttonDisabledColor,
    required this.borderColor,
    required this.dividerColor,
    required this.iconPrimaryColor,
    required this.iconSecondaryColor,
    required this.iconActiveColor,
    required this.successColor,
    required this.errorColor,
    required this.warningColor,
    required this.infoColor,
    required this.priceColor,
    required this.badgeColor,
    required this.favoriteActiveColor,
    required this.favoriteInactiveColor,
    required this.tagBackgroundColor,
    required this.tagTextColor,
    required this.bottomNavBackgroundColor,
    required this.bottomNavActiveColor,
    required this.bottomNavInactiveColor,
    required this.inputFillColor,
    required this.inputBorderColor,
    required this.inputFocusedBorderColor,
    required this.shadowColor,
  });
}