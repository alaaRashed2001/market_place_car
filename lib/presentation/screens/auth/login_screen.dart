import 'package:flutter/material.dart';
import 'package:market_place_car/core/global/localization/locale/app_localizations_setup.dart';
import 'package:market_place_car/presentation/widgets/shared_component/language_selector_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;

    return Scaffold(
      body: Column(
        children: [
          Text(l.welcomeBack),
          Text(l.signInSubtitle),
          TextField(decoration: InputDecoration(hintText: l.phoneNumber)),
          TextField(
            obscureText: true,
            decoration: InputDecoration(hintText: l.password),
          ),
          TextButton(onPressed: () {}, child: Text(l.forgotPassword)),
          ElevatedButton(onPressed: () {}, child: Text(l.signIn)),
          Text(l.orContinueWith),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(l.dontHaveAccount),
              TextButton(onPressed: () {}, child: Text(l.signUp)),
            ],
          ),
          LanguageSelectorWidget(),
        ],
      ),
    );
  }
}
