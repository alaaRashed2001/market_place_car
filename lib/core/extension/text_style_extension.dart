import 'package:flutter/material.dart';

extension TextStyleExtension on BuildContext {
  TextTheme get _textTheme => Theme.of(this).textTheme;

  TextStyle? get h1Bold34 => _textTheme.displayLarge;
  TextStyle? get h1Regular34 => _textTheme.displayMedium;
  TextStyle? get h1Bold28 => _textTheme.displaySmall;
  TextStyle? get h1Regular28 => _textTheme.headlineLarge;

  TextStyle? get h2Bold26 => _textTheme.headlineMedium;
  TextStyle? get h2Regular26 => _textTheme.headlineSmall;
  TextStyle? get h2Bold22 => _textTheme.titleLarge;
  TextStyle? get h2Regular22 => _textTheme.titleMedium;

  TextStyle? get titleBold18 => _textTheme.titleSmall;
  TextStyle? get titleRegular18 => _textTheme.bodyLarge;

  TextStyle? get buttonBold => _textTheme.labelLarge;
  TextStyle? get buttonRegular => _textTheme.labelMedium;

  TextStyle? get inputBold16 => _textTheme.bodyMedium;
  TextStyle? get inputRegular16 => _textTheme.bodySmall;
  TextStyle? get inputBold14 => _textTheme.labelSmall;

  TextStyle? get bodyBold14 => _textTheme.labelLarge?.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w900,
  );
  TextStyle? get bodyRegular14 => _textTheme.labelMedium?.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
}
