import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_place_car/core/extension/app_sizes.dart';
import 'package:market_place_car/core/global/localization/locale/app_localizations_setup.dart';
import 'package:market_place_car/core/shared_component/custom_elevated_button.dart';
import 'package:market_place_car/core/shared_component/app_text_form_field.dart';
import 'package:market_place_car/presentation/controller/cubit/auth/auth_cubit.dart';
import 'package:market_place_car/presentation/controller/cubit/auth/auth_state.dart';
import 'package:market_place_car/presentation/screens/auth/login_screen.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  final String phone;
  const CreateNewPasswordScreen({super.key, required this.phone});

  @override
  State<CreateNewPasswordScreen> createState() => _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _submitReset() {
    if (_formKey.currentState!.validate()) {
      context.read<AuthCubit>().resetPassword(
            phoneNumber: widget.phone,
            newPassword: _passwordController.text,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text(l.createNewPassword),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthInitial) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Password updated successfully! Please login.'),
                backgroundColor: Colors.green,
              ),
            );
            // Navigate back to Login and clear history
            // NavigatorHelper.jump(
            //   context,
            //   screen: const LoginScreen(),
            //   replace: true,
            // );
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
                    Icons.security_rounded,
                    size: 80,
                    color: isDark ? Colors.white70 : Colors.black54,
                  ),
                  context.addVerticalSpace(24),
                  Text(
                    l.createNewPassword,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white : Colors.black,
                    ),
                  ),
                  context.addVerticalSpace(12),

                  Text(
                    l.createNewPasswordSubtitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: isDark ? Colors.white60 : Colors.black54,
                      height: 1.5,
                    ),
                  ),
                  context.addVerticalSpace(36),

                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        // New Password
                        AppTextFormField(
                          controller: _passwordController,
                          hintText: l.newPassword,
                          obscure: true,
                          inputType: TextInputType.visiblePassword,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return l.fieldRequired;
                            }
                            if (value.length < 8) {
                              return l.passwordTooShort;
                            }
                            return null;
                          },
                        ),
                        context.addVerticalSpace(16),

                        // Confirm Password
                        AppTextFormField(
                          controller: _confirmPasswordController,
                          hintText: l.confirmPassword,
                          obscure: true,
                          inputType: TextInputType.visiblePassword,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return l.fieldRequired;
                            }
                            if (value != _passwordController.text) {
                              return l.passwordsDoNotMatch;
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  context.addVerticalSpace(40),

                  CustomElevatedButton(
                    text: l.confirm,
                    isLoading: isLoading,
                    onPressed: _submitReset,
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
