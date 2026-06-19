import 'package:flutter/material.dart';
import 'package:market_place_car/core/global/theme/theme_data/app_theme.dart';

mixin SnackBarHelper {
  static void showSnackBar(
      BuildContext context, {
        required String? message,
        bool error = false,
        Duration duration = const Duration(seconds: 3),
      }) {
    if (message == null || message.isEmpty) return;


    final isDark = Theme.of(context).brightness == Brightness.dark;
    final appColors = isDark ? AppTheme.darkColors : AppTheme.lightColors;

    final backgroundColor = error ? appColors.errorColor : appColors.successColor;
    final icon = error ? Icons.error_outline : Icons.check_circle_outline;


    ScaffoldMessenger.of(context).clearSnackBars();


    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(icon, color: appColors.snackBarTextColor),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                message,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: appColors.snackBarTextColor,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: backgroundColor,
        duration: duration,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(
          top: 16,
          left: 16,
          right: 16,
          bottom: MediaQuery.of(context).size.height - 140,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 4,
      ),
    );
  }
}