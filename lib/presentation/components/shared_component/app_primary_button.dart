import 'package:flutter/material.dart';
import 'package:market_place_car/core/extension/responsive_layout_extention.dart';
import 'package:market_place_car/core/global/theme/custom_theme/custom_button_theme.dart';
import 'package:market_place_car/presentation/components/shared_component/enums.dart';

class AppPrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final ButtonStatus status;

  const AppPrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.status = ButtonStatus.normal,
  });

  @override
  Widget build(BuildContext context) {
    final customButtonTheme = Theme.of(context).extension<CustomButtonTheme>();

    ButtonStyle? buttonStyle;
    if (status == ButtonStatus.wrong) {
      buttonStyle = customButtonTheme?.wrongStyle;
    } else {
      buttonStyle = customButtonTheme?.normalStyle;
    }

    final bool isDisabled = status == ButtonStatus.disabled || isLoading;
    return ElevatedButton(
      onPressed: isDisabled ? null : onPressed,
      style: buttonStyle,
      child: isLoading
          ? SizedBox(
              width: context.wp(5),

              height: context.wp(5),
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          : Text(text),
    );
  }
}
