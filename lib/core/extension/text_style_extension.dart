import 'package:flutter/material.dart';

extension TextStyleExtension on BuildContext {
  TextTheme get _textTheme => Theme.of(this).textTheme;

  // --- H1 Styles ---
  TextStyle? get h1Bold34 => _textTheme.displayLarge;
  TextStyle? get h1Regular34 => _textTheme.displayMedium;
  TextStyle? get h1Bold28 => _textTheme.displaySmall;
  TextStyle? get h1Regular28 => _textTheme.headlineLarge;

  // --- H2 Styles ---
  TextStyle? get h2Bold26 => _textTheme.headlineMedium;
  TextStyle? get h2Regular26 => _textTheme.headlineSmall;
  TextStyle? get h2Bold22 => _textTheme.titleLarge;
  TextStyle? get h2Regular22 => _textTheme.titleMedium;

  // --- Title Styles ---
  TextStyle? get titleBold18 => _textTheme.titleSmall;
  TextStyle? get titleRegular18 => _textTheme.bodyLarge;

  // --- Button Styles ---
  TextStyle? get buttonBold => _textTheme.labelLarge;
  TextStyle? get buttonRegular => _textTheme.labelMedium;

  // --- Input & Body Styles (تمت إضافتها بناءً على الصورة) ---
  TextStyle? get inputBold16 => _textTheme.bodyMedium;
  TextStyle? get inputRegular16 => _textTheme.bodySmall;
  TextStyle? get inputBold14 => _textTheme.labelSmall;

  // خطوط الـ Body الأساسية بمقاس 14
  TextStyle? get bodyBold14 => _textTheme.labelLarge?.copyWith(fontSize: 14, fontWeight: FontWeight.w700);
  TextStyle? get bodyRegular14 => _textTheme.labelMedium?.copyWith(fontSize: 14, fontWeight: FontWeight.w400);
}