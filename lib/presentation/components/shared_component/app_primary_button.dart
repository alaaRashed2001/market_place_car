import 'package:flutter/material.dart';
import 'package:market_place_car/core/extension/responsive_layout_extention.dart';

class AppPrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;

  const AppPrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,

      child: isLoading
          ? SizedBox(
              width: context.wp(5),
              height: context.wp(5),
              child: const CircularProgressIndicator(strokeWidth: 2),
            )
          : Text(text),
    );
  }
}
