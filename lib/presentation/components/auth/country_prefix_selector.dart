import 'package:flutter/material.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:market_place_car/core/extension/app_sizes.dart';
import 'package:market_place_car/core/extension/text_style_extension.dart';

class CountryPrefixSelector extends StatelessWidget {
  final Country selectedCountry;
  final VoidCallback onTap;

  const CountryPrefixSelector({
    super.key,
    required this.selectedCountry,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              selectedCountry.flag,
              style: const TextStyle(fontSize: 20),
            ),
            context.addHorizontalSpace(4),
            Text(
              "+${selectedCountry.displayCC}",
              style: context.bodyRegular14,
            ),
            const Icon(
              Icons.arrow_drop_down,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}