import 'package:flutter/material.dart';
import 'package:market_place_car/core/constants/app_images.dart';
import 'package:market_place_car/data/services/service_locator.dart';
import 'package:market_place_car/presentation/helper/navigator_helper.dart';
import 'package:market_place_car/presentation/screens/auth/login_screen.dart';
import 'package:market_place_car/presentation/screens/onboarding/onboarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    await Future.delayed(const Duration(seconds: 3));
    if (!mounted) return;

    final prefs = sl<SharedPreferences>();
    final isOnboardingSeen = prefs.getBool('IS_ONBOARDING_SEEN') ?? false;

    if (!mounted) return;

    if (isOnboardingSeen) {
      NavigatorHelper.jump(context, screen: const LoginScreen(), replace: true);
    } else {
      NavigatorHelper.jump(
        context,
        screen: const OnboardingScreen(),
        replace: true,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 24,
        children: [
          Image.asset(AppImages.splash, width: 704, height: 566.015625),
          Text(
            "Welcome to CarAds App",
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontSize: 22,
              fontWeight: FontWeight.w900,
              height: 1,
            ),
          ),
          Text(
            "Your Gateway to Car Showrooms and Rental Offices",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w300,
              height: 1,
            ),
          ),
        ],
      ),
    );
  }
}