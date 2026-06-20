import 'package:flutter/material.dart';
import 'package:market_place_car/core/extension/text_style_extension.dart';

enum AppTextButtonStyleType { smallGray, mediumBlack }

class AppTextButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final AppTextButtonStyleType type;

  const AppTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.type = AppTextButtonStyleType.mediumBlack,
  });
  TextStyle _getStyle(BuildContext context) {
    switch (type) {
      case AppTextButtonStyleType.smallGray:
        return context.inputRegular16!.copyWith(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          height: 1.0,
          color: const Color(0xff999999),
        );

      case AppTextButtonStyleType.mediumBlack:
        return context.inputRegular16!.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          height: 1.0,

        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,

      child: Text(text, style: _getStyle(context)),
    );
  }
}
