import 'package:flutter/material.dart';
import 'package:market_place_car/core/routing/routes.dart';
import 'package:market_place_car/presentation/screens/auth/login_screen.dart';
import 'package:market_place_car/presentation/screens/onboarding/onboarding_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());

      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No Route Found ${settings.name}')),
          ),
        );
    }
  }
}
