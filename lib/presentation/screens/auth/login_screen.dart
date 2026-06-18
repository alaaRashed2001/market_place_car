import 'package:flutter/material.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:market_place_car/core/constants/app_images.dart';
import 'package:market_place_car/core/extension/sized_box_extension.dart';
import 'package:market_place_car/core/global/localization/locale/app_localizations_setup.dart';
import 'package:market_place_car/presentation/components/shared_component/app_bottom_sheet.dart';
import 'package:market_place_car/presentation/components/auth/auth_text_field.dart';
import 'package:market_place_car/presentation/components/auth/country_picker_bottom_sheet.dart';
import 'package:market_place_car/presentation/helper/app_asset_helper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginFormKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  Country _selectedCountry = countries.firstWhere(
    (country) => country.code == "AE",
  );

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsetsDirectional.only(start: 20, end: 20, top: 104),
        child: Column(
          children: [
            AppAssetHelper.svgImage(
              AppImages.yellowCar,
              width: 172,
              height: 50,
            ),
            16.height,
            Text(l.welcomeBack),
            4.height,
            Text(l.signInSubtitle, textAlign: TextAlign.center),
            24.height,

            Form(
              key: _loginFormKey,
              child: Column(
                children: [
                  AuthTextField(
                    controller: _phoneController,
                    hintText: 'Phone Number',
                    inputType: TextInputType.phone,
                    prefixImage: InkWell(
                      borderRadius: BorderRadius.circular(8),
                      onTap: () async {
                        final result = await AppBottomSheet.show<Country>(
                          context: context,

                          builder: (scrollController) =>
                              CountryPickerBottomSheet(
                                scrollController: scrollController,
                              ),
                        );

                        if (result != null) {
                          setState(() {
                            _selectedCountry = result;
                          });
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              _selectedCountry.flag,
                              style: const TextStyle(fontSize: 20),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              "+${_selectedCountry.displayCC}",
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                            const Icon(
                              Icons.arrow_drop_down,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your phone number';
                      }
                      return null;
                    },
                  ),
                  16.height,

                  AuthTextField(
                    controller: _passwordController,
                    hintText: 'Password',
                    obscure: true,
                    inputType: TextInputType.visiblePassword,
                    validator: (value) {
                      if (value == null || value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
