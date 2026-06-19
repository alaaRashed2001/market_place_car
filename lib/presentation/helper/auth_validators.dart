import 'package:flutter/material.dart';
import 'package:market_place_car/core/global/localization/locale/app_localizations_setup.dart';

class AuthValidators {
  static String? validateRequired(BuildContext context, String? value) {
    if (value == null || value.trim().isEmpty) {
      return context.l10n.fieldRequired;
    }
    return null;
  }

  static String? validateEmail(BuildContext context, String? value) {
    if (value == null || value.trim().isEmpty) {
      return context.l10n.fieldRequired;
    }
    final emailRegExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!emailRegExp.hasMatch(value.trim())) {
      return context.l10n.invalidEmail;
    }
    return null;
  }

  static String? validatePassword(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return context.l10n.fieldRequired;
    }
    if (value.length < 6) {
      return context.l10n.passwordTooShort;
    }
    return null;
  }


  static String? validateConfirmPassword(
      BuildContext context, String? value, String password) {
    if (value == null || value.isEmpty) {
      return context.l10n.fieldRequired;
    }
    if (value != password) {
      return context.l10n.passwordsDoNotMatch;
    }
    return null;
  }
}