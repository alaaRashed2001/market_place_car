import 'package:flutter/material.dart';
import 'package:market_place_car/core/extension/app_sizes.dart';
import 'package:market_place_car/core/extension/text_style_extension.dart';

class PasswordValidations extends StatelessWidget {
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialCharacters;
  final bool hasNumber;
  final bool hasMinLength;
  const PasswordValidations({
    super.key,
    required this.hasLowerCase,
    required this.hasUpperCase,
    required this.hasSpecialCharacters,
    required this.hasNumber,
    required this.hasMinLength,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BuildValidationRow(
          text: 'At least 1 lowercase letter',
          hasValidated: hasLowerCase,
        ),
        context.addVerticalSpace(2),
        BuildValidationRow(
          text: 'At least 1 uppercase letter',
          hasValidated: hasUpperCase,
        ),
        context.addVerticalSpace(2),
        BuildValidationRow(
          text: 'At least 1 special character',
          hasValidated: hasSpecialCharacters,
        ),
        context.addVerticalSpace(2),
        BuildValidationRow(text: 'At least 1 number', hasValidated: hasNumber),
        context.addVerticalSpace(2),
        BuildValidationRow(
          text: 'At least 8 characters long',
          hasValidated: hasMinLength,
        ),
      ],
    );
  }
}

class BuildValidationRow extends StatelessWidget {
  final String text;
  final bool hasValidated;
  const BuildValidationRow({
    super.key,
    required this.text,
    required this.hasValidated,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(radius: 2.5,
            //backgroundColor:
      //  context.colors.textPrimaryColor
        ),
        context.addHorizontalSpace(6),
        Text(
          text,
          style: context.font28Regular?.copyWith(
            decoration: hasValidated ? TextDecoration.lineThrough : null,
            decorationColor: Colors.green,
            decorationThickness: 2,
            // color: hasValidated
            //     ? context.colors.textPrimaryColor
            //     : context.colors.primaryColor,
          ),
        ),
      ],
    );
  }
}
