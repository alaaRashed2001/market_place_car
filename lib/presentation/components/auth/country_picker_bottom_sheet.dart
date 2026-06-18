import 'package:flutter/material.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:market_place_car/core/extension/opacity_of_color.dart';
import 'package:market_place_car/core/extension/sized_box_extension.dart';
import 'package:market_place_car/presentation/components/auth/auth_text_field.dart';

class CountryPickerBottomSheet extends StatefulWidget {
  final ScrollController scrollController;
  const CountryPickerBottomSheet({super.key, required this.scrollController});

  @override
  State<CountryPickerBottomSheet> createState() =>
      _CountryPickerBottomSheetState();
}

class _CountryPickerBottomSheetState extends State<CountryPickerBottomSheet> {
  final _searchController = TextEditingController();
  List<Country> _filteredCountries = [];

  List<Country> get _countriesList =>
      _searchController.text.isNotEmpty ? _filteredCountries : countries;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String localeCode = Localizations.localeOf(context).languageCode;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        spacing: 10,
        children: [
          Container(
            width: 40,
            height: 5,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: AuthTextField(
              controller: _searchController,
              hintText: "Search country...",
              isSearch: true,
              onChanged: (String value) {
                setState(() {
                  _filteredCountries = countries
                      .where(
                        (country) =>
                            country.name.toLowerCase().contains(
                              value.toLowerCase(),
                            ) ||
                            country
                                .localizedName(localeCode)
                                .toLowerCase()
                                .contains(value.toLowerCase()),
                      )
                      .toList();
                });
              },
            ),
          ),

          Expanded(
            child: ListView.separated(
              controller: widget.scrollController,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 12.0,
              ),
              itemCount: _countriesList.length,
              separatorBuilder: (context, index) => 10.height,
              itemBuilder: (context, index) {
                final Country country = _countriesList[index];

                return Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.changeOpacity(0.04),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ListTile(
                    onTap: () {
                      Navigator.pop(context, country);
                    },
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    leading: Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: Colors.grey.changeOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        country.flag,
                        style: const TextStyle(fontSize: 24),
                      ),
                    ),
                    title: Text(
                      country.localizedName(localeCode),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(
                        country.code,
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    trailing: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(
                          context,
                        ).primaryColor.changeOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        "+${country.displayCC}",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        textDirection: TextDirection.ltr,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
