import 'package:flutter/material.dart';

class CustomButtonTheme extends ThemeExtension<CustomButtonTheme> {
  final ButtonStyle normalStyle;
  final ButtonStyle wrongStyle;

  const CustomButtonTheme({
    required this.normalStyle,
    required this.wrongStyle,
  });

  @override
  CustomButtonTheme copyWith({ButtonStyle? normalStyle, ButtonStyle? wrongStyle}) {
    return CustomButtonTheme(
      normalStyle: normalStyle ?? this.normalStyle,
      wrongStyle: wrongStyle ?? this.wrongStyle,
    );
  }

  @override
  CustomButtonTheme lerp(ThemeExtension<CustomButtonTheme>? other, double t) {
    if (other is! CustomButtonTheme) return this;
    return CustomButtonTheme(
      normalStyle: ButtonStyle.lerp(normalStyle, other.normalStyle, t)!,
      wrongStyle: ButtonStyle.lerp(wrongStyle, other.wrongStyle, t)!,
    );
  }
}