import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:market_place_car/core/constants/app_images.dart';
import 'package:market_place_car/core/extension/sized_box_extension.dart';
import 'package:market_place_car/core/extension/text_style_extension.dart';
import 'package:market_place_car/core/global/localization/locale/app_localizations_setup.dart';
import 'package:market_place_car/domain/repositories/auth/auth_repository.dart';
import 'package:market_place_car/data/services/service_locator.dart';
import 'package:market_place_car/presentation/components/auth/auth_phone_text_field.dart';
import 'package:market_place_car/presentation/components/auth/auth_text_field.dart';
import 'package:market_place_car/presentation/components/shared_component/app_primary_button.dart';
import 'package:market_place_car/presentation/components/shared_component/app_text_button.dart';
import 'package:market_place_car/presentation/components/auth/social_login_row.dart';
import 'package:market_place_car/presentation/controller/cubit/auth/auth_cubit.dart';
import 'package:market_place_car/presentation/controller/cubit/auth/auth_state.dart';
import 'package:market_place_car/presentation/helper/app_asset_helper.dart';
import 'package:market_place_car/presentation/helper/auth_validators.dart';
import 'package:market_place_car/presentation/helper/navigator_helper.dart';
import 'package:market_place_car/presentation/helper/snack_bar_helper.dart';
import 'package:market_place_car/presentation/screens/auth/forgot_password_screen.dart';
import 'package:market_place_car/presentation/screens/auth/sign_up_screen.dart';
import 'package:market_place_car/presentation/screens/main_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginFormKey = GlobalKey<FormState>();

  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Country _selectedCountry = countries.firstWhere((c) => c.code == "AE");

  void _submitLogin() {
    if (_loginFormKey.currentState!.validate()) {
      final fullPhoneNumber =
          "+${_selectedCountry.displayCC}${_phoneController.text.trim()}";
      context.read<AuthCubit>().login(
        phoneNumber: fullPhoneNumber,
        password: _passwordController.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            sl<AuthRepository>().saveToken(state.user.token ?? '');
            SnackBarHelper.showSnackBar(
              context,
              message: 'Welcome, ${state.user.fullName}!',
              error: false,
            );

            NavigatorHelper.jump(
              context,
              screen: const MainScreen(),
              replace: true,
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

          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                20.height,

                AppAssetHelper.svgImage(
                  AppImages.yellowCar,
                  width: 172,
                  height: 50,
                ),
                32.height,

                Text(l.welcomeBack, style: context.titleBold18),
                8.height,
                Text(
                  l.signInSubtitle,
                  textAlign: TextAlign.center,
                  style: context.bodyRegular14,
                ),
                40.height,

                Form(
                  key: _loginFormKey,
                  child: Column(
                    children: [
                      AuthPhoneTextField(
                        controller: _phoneController,
                        onCountryChanged: (country) {
                          _selectedCountry = country;
                        },
                      ),
                      16.height,

                      AuthTextField(
                        controller: _passwordController,
                        hintText: l.password,
                        obscure: true,
                        inputType: TextInputType.visiblePassword,
                        validator: (value) => AuthValidators.validatePassword(context, value),
                      ),
                    ],
                  ),
                ),
                16.height,

                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: AppTextButton(
                    text: l.forgotPassword,
                    onPressed: () => NavigatorHelper.jump(
                      context,
                      screen: const ForgotPasswordScreen(),
                    ),
                  ),
                ),
                24.height,
                AppPrimaryButton(
                  text: l.signIn,
                  isLoading: isLoading,
                  onPressed: _submitLogin,
                ),
                32.height,

                Row(
                  children: [
                    Expanded(child: Divider()),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        l.orContinueWith,
                        style: context.bodyRegular14,
                      ),
                    ),
                    Expanded(child: Divider()),
                  ],
                ),
                24.height,
                const SocialLoginRow(),
                32.height,

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(l.dontHaveAccount, style: context.bodyRegular14),
                    const SizedBox(width: 8),
                    GestureDetector(
                      onTap: () => NavigatorHelper.jump(
                        context,
                        screen: const SignUpScreen(),
                      ),
                      child: Text(
                        l.signUp,
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
