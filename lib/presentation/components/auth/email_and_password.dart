import 'package:flutter/material.dart';
import 'package:market_place_car/core/extension/app_sizes.dart';
import 'package:market_place_car/core/shared_component/app_regex.dart';
import 'package:market_place_car/core/shared_component/app_text_form_field.dart';
import 'package:market_place_car/presentation/components/auth/password_validations.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool isObscureText = true;

  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  late TextEditingController passwordController;
  late TextEditingController emailController;
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    // passwordController = context.read<LoginCubit>().passwordController;
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowercase = AppRegex.hasLowerCase(passwordController.text);
        hasUppercase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacters = AppRegex.hasSpecialCharacter(
          passwordController.text,
        );
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  void dispose() {
    passwordController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          AppTextFormField(
            controller: emailController,
            hintText: 'Email',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          context.addVerticalSpace(18),
          AppTextFormField(
            controller: passwordController,
            hintText: 'Password',

            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid password';
              }
              return null;
            },
          ),
          context.addVerticalSpace(24),
          PasswordValidations(
            hasLowerCase: hasLowercase,
            hasUpperCase: hasUppercase,
            hasSpecialCharacters: hasSpecialCharacters,
            hasNumber: hasNumber,
            hasMinLength: hasMinLength,
          ),
        ],
      ),
    );
  }
}
