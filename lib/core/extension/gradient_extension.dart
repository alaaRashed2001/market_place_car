import 'package:flutter/material.dart';

extension GradientExtensions on BuildContext {
  LinearGradient appGradient({
    double opacity = 1,
    Axis axis = Axis.vertical,
    List<Color>? colors,
  }) {
    return LinearGradient(
      begin: axis == Axis.vertical
          ? Alignment.topCenter
          : Alignment.centerLeft,
      end: axis == Axis.vertical
          ? Alignment.bottomCenter
          : Alignment.centerRight,
      colors: colors ??
          [
            Theme.of(this).primaryColor.withOpacity(opacity),
            Theme.of(this).colorScheme.secondary.withOpacity(opacity),
          ],
    );
  }
}