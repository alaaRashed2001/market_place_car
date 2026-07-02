import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:market_place_car/core/constants/app_images.dart';
import 'package:market_place_car/core/extension/app_sizes.dart';
import 'package:market_place_car/core/extension/text_style_extension.dart';
import 'package:market_place_car/core/global/localization/locale/app_localizations_setup.dart';
import 'package:market_place_car/core/shared_component/custom_elevated_button.dart';
import 'package:market_place_car/presentation/components/auth/auth_phone_text_field.dart';
import 'package:market_place_car/core/shared_component/app_text_form_field.dart';
import 'package:market_place_car/presentation/controller/cubit/auth/auth_cubit.dart';
import 'package:market_place_car/presentation/controller/cubit/auth/auth_state.dart';
import 'package:market_place_car/presentation/helper/app_asset_helper.dart';
import 'package:market_place_car/presentation/helper/auth_validators.dart';
import 'package:market_place_car/presentation/helper/snack_bar_helper.dart';
import 'package:market_place_car/presentation/screens/auth/verify_signup_otp_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _signUpFormKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Country _selectedCountry = countries.firstWhere((c) => c.code == "AE");

  void _submitSignUp() {
    if (_signUpFormKey.currentState!.validate()) {
      final fullPhoneNumber =
          "+${_selectedCountry.displayCC}${_phoneController.text.trim()}";
      context.read<AuthCubit>().signUp(
        fullName: _nameController.text.trim(),
        email: _emailController.text.trim(),
        phoneNumber: fullPhoneNumber,
        password: _passwordController.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;

    return Scaffold(
      appBar: AppBar(
        title: Text(l.signUp),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is SignUpSuccess) {
            SnackBarHelper.showSnackBar(
              context,
              message: 'Registration successful! OTP Sent.',
              error: false,
            );

         //   NavigatorHelper.jump(context, screen: const OtpVerificationPage());
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

          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppAssetHelper.svgImage(
                  AppImages.yellowCar,
                  width: 140,
                  height: 40,
                ),
                context.addVerticalSpace(12),
                Text(l.joinCarAds, style: context.font18Bold),
                context.addVerticalSpace(12),
                Text(
                  l.signUpSubtitle,
                  textAlign: TextAlign.center,
                  style: context.font18Bold,
                ),
                context.addVerticalSpace(12),

                Form(
                  key: _signUpFormKey,
                  child: Column(
                    children: [
                      // Full Name
                      AppTextFormField(
                        controller: _nameController,
                        hintText: l.fullName,
                        inputType: TextInputType.name,
                        validator: (value) =>
                            AuthValidators.validateRequired(context, value),
                      ),
                      context.addVerticalSpace(12),

                      // Email
                      AppTextFormField(
                        controller: _emailController,
                        hintText: l.emailAddress,
                        inputType: TextInputType.emailAddress,
                        validator: (value) =>
                            AuthValidators.validateEmail(context, value),
                      ),
                      context.addVerticalSpace(12),

                      // Phone Number
                      AuthPhoneTextField(
                        controller: _phoneController,
                        onCountryChanged: (country) {
                          _selectedCountry = country;
                        },
                      ),
                      context.addVerticalSpace(12),

                      // Password
                      AppTextFormField(
                        controller: _passwordController,
                        hintText: l.password,
                        obscure: true,
                        inputType: TextInputType.visiblePassword,
                        validator: (value) =>
                            AuthValidators.validatePassword(
                              context,
                              value,
                            ),
                      ),
                      context.addVerticalSpace(16),

                      // Confirm Password
                      AppTextFormField(
                        controller: _confirmPasswordController,
                        hintText: l.confirmPassword,
                        obscure: true,
                        inputType: TextInputType.visiblePassword,
                        validator: (value) =>
                            AuthValidators.validateConfirmPassword(
                              context,
                              value,
                              _passwordController.text,
                            ),
                      ),
                    ],
                  ),
                ),
                context.addVerticalSpace(12),


                CustomElevatedButton(
                  text: l.signUp,
                  isLoading: isLoading,
                  onPressed: _submitSignUp,
                ),
                context.addVerticalSpace(12),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(l.alreadyHaveAccount, style: context.font18Bold),
                    const SizedBox(width: 8),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Text(
                        l.signIn,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffff8a3d),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
