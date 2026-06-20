import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:market_place_car/core/extension/app_sizes.dart';
import 'package:market_place_car/core/global/localization/locale/app_localizations_setup.dart';
import 'package:market_place_car/presentation/components/auth/auth_phone_text_field.dart';
import 'package:market_place_car/presentation/components/shared_component/app_primary_button.dart';
import 'package:market_place_car/presentation/components/shared_component/back_icon_button.dart';
import 'package:market_place_car/presentation/controller/cubit/auth/auth_cubit.dart';
import 'package:market_place_car/presentation/controller/cubit/auth/auth_state.dart';
import 'package:market_place_car/presentation/helper/navigator_helper.dart';
import 'package:market_place_car/presentation/helper/snack_bar_helper.dart';
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
      final fullPhoneNumber =
          "+${_selectedCountry.displayCC}${_phoneController.text.trim()}";
      context.read<AuthCubit>().forgotPassword(phoneNumber: fullPhoneNumber);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(

      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is ForgotPasswordSuccess) {
            final fullPhoneNumber =
                "+${_selectedCountry.displayCC}${_phoneController.text.trim()}";
            SnackBarHelper.showSnackBar(
              context,
              message: 'OTP sent successfully!',
              error: false,
            );

            NavigatorHelper.jump(
              context,
              screen: VerifyOtpScreen(phone: fullPhoneNumber),
            );
          } else if (state is AuthError) {
            SnackBarHelper.showSnackBar(
              context,
              message: state.message,
              error: true,
            );
          }
        },
        builder: (context, state) {
          final isLoading = state is AuthLoading;

          return SafeArea(
            child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.topLeft,
                      child: BackIconButton()),
                  Icon(
                    Icons.lock_reset_rounded,
                    size: 80,
                    color: isDark ? Colors.white70 : Colors.black54,
                  ),
                  context.addVerticalSpace(24),
                  Text(
                    l.forgotPassword,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white : Colors.black,
                    ),
                  ),
                  context.addVerticalSpace(12),
                  Text(
                    l.forgotPasswordSubtitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: isDark ? Colors.white60 : Colors.black54,
                      height: 1.5,
                    ),
                  ),
                  context.addVerticalSpace(36),

                  Form(
                    key: _forgotFormKey,
                    child: AuthPhoneTextField(
                      controller: _phoneController,
                      onCountryChanged: (country) {
                        _selectedCountry = country;
                      },
                    ),
                  ),
                  context.addVerticalSpace(36),

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
