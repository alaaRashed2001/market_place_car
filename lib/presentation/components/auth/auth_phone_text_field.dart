import 'package:flutter/material.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:market_place_car/core/global/localization/locale/app_localizations_setup.dart';
import 'package:market_place_car/presentation/components/auth/auth_text_field.dart';
import 'package:market_place_car/presentation/components/auth/country_prefix_selector.dart';
import 'package:market_place_car/presentation/components/shared_component/app_bottom_sheet.dart';
import 'package:market_place_car/presentation/components/auth/country_picker_bottom_sheet.dart';

class AuthPhoneTextField extends StatefulWidget {
  final TextEditingController controller;
  final ValueChanged<Country> onCountryChanged;

  const AuthPhoneTextField({
    super.key,
    required this.controller,
    required this.onCountryChanged,
  });

  @override
  State<AuthPhoneTextField> createState() => _AuthPhoneTextFieldState();
}

class _AuthPhoneTextFieldState extends State<AuthPhoneTextField> {
  Country _selectedCountry = countries.firstWhere(
    (country) => country.code == "AE",
  );

  bool _isPickerOpen = false;
  Future<void> _onCountryPickerTap() async {
    if (_isPickerOpen) return;

    _isPickerOpen = true;

    final result = await AppBottomSheet.show<Country>(
      context: context,
      isScrollable: true,
      initialChildSize: 0.75,
      minChildSize: 0.4,
      maxChildSize: 0.95,
      builder: (context, scrollController) {
        return CountryPickerBottomSheet(
          scrollController: scrollController!,
        );
      },
    );

    _isPickerOpen = false;

    if (!mounted) return;

    if (result != null && result != _selectedCountry) {
      setState(() {
        _selectedCountry = result;
      });

      widget.onCountryChanged(result);
    }
  }


  @override
  Widget build(BuildContext context) {
    final l = context.l10n;

    return AuthTextField(
      controller: widget.controller,
      hintText: l.phoneNumber,
      inputType: TextInputType.phone,
      prefixImage: CountryPrefixSelector(
        selectedCountry: _selectedCountry,
        onTap: _onCountryPickerTap,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return l.fieldRequired;
        }
        if (value.length < 7) {
          return l.invalidPhone;
        }
        return null;
      },
    );
  }
}
