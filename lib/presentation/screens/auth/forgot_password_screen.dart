import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:market_place_car/core/extension/sized_box_extension.dart';
import 'package:market_place_car/core/global/localization/locale/app_localizations_setup.dart';
import 'package:market_place_car/presentation/components/shared_component/app_bottom_sheet.dart';
import 'package:market_place_car/presentation/components/auth/auth_text_field.dart';
import 'package:market_place_car/presentation/components/auth/country_picker_bottom_sheet.dart';
import 'package:market_place_car/presentation/components/shared_component/app_primary_button.dart';
import 'package:market_place_car/presentation/controller/cubit/auth/auth_cubit.dart';
import 'package:market_place_car/presentation/controller/cubit/auth/auth_state.dart';
import 'package:market_place_car/presentation/helper/navigator_helper.dart';
import 'package:market_place_car/presentation/screens/auth/verify_otp_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _forgotFormKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();

  Country _selectedCountry = countries.firstWhere(
    (country) => country.code == "AE",
  );

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  void _submitForgotPassword() {
    if (_forgotFormKey.currentState!.validate()) {
      final fullPhoneNumber = "+${_selectedCountry.displayCC}${_phoneController.text.trim()}";
      context.read<AuthCubit>().forgotPassword(phoneNumber: fullPhoneNumber);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text(l.forgotPassword),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is ForgotPasswordSuccess) {
            final fullPhoneNumber = "+${_selectedCountry.displayCC}${_phoneController.text.trim()}";
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('OTP sent successfully!'),
                backgroundColor: Colors.green,
              ),
            );
            NavigatorHelper.jump(
              context,
              screen: VerifyOtpScreen(phone: fullPhoneNumber),
            );
          } else if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.redAccent,
              ),
            );
          }
        },
        builder: (context, state) {
          final isLoading = state is AuthLoading;

          return SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  Icon(
                    Icons.lock_reset_rounded,
                    size: 80,
                    color: isDark ? Colors.white70 : Colors.black54,
                  ),
                  24.height,
                  Text(
                    l.forgotPassword,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white : Colors.black,
                    ),
                  ),
                  12.height,
                  Text(
                    l.forgotPasswordSubtitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: isDark ? Colors.white60 : Colors.black54,
                      height: 1.5,
                    ),
                  ),
                  36.height,

                  Form(
                    key: _forgotFormKey,
                    child: AuthTextField(
                      controller: _phoneController,
                      hintText: l.phoneNumber,
                      inputType: TextInputType.phone,
                      prefixImage: InkWell(
                        borderRadius: BorderRadius.circular(8),
                        onTap: () async {
                          final result =await AppBottomSheet.showScrollable<Country>(
                            context: context,
                            scrollableBuilder: (context, scrollController) => CountryPickerBottomSheet(
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
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: isDark ? Colors.white : Colors.black,
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
                          return l.fieldRequired;
                        }
                        if (value.length < 7) {
                          return l.invalidPhone;
                        }
                        return null;
                      },
                    ),
                  ),
                  36.height,

                  AppPrimaryButton(
                    text: l.send,
                    isLoading: isLoading,
                    onPressed: _submitForgotPassword,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
