import 'package:flutter/material.dart';
import 'package:market_place_car/core/global/theme/theme_data/app_theme.dart';

class AppPrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isDanger;

  const AppPrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.isDanger = false,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final appColors = isDark ? AppTheme.darkColors : AppTheme.lightColors;

    final defaultButtonTextColor =
        Theme.of(
          context,
        ).elevatedButtonTheme.style?.foregroundColor?.resolve({}) ??
        Colors.white;

    final backgroundColor = isDanger ? appColors.dangerButtonColor : null;
    final foregroundColor = isDanger ? appColors.textPrimaryColor : null;

    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: isDanger
          ? ElevatedButton.styleFrom(
              backgroundColor: backgroundColor,
              foregroundColor: foregroundColor,
            )
          : null,
      child: isLoading
          ? SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(
                  isDanger
                      ? (foregroundColor ?? Colors.white)
                      : defaultButtonTextColor,
                ),
              ),
            )
          : Text(text),
    );
  }
}
