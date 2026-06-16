import 'package:shared_preferences/shared_preferences.dart';

abstract class OnboardingLocalDataSource {
  Future<bool> setOnboardingSeen();
  Future<bool> isOnboardingSeen();
}

class OnboardingLocalDataSourceImpl implements OnboardingLocalDataSource {
  final SharedPreferences sharedPreferences;

  static const String _key = 'IS_ONBOARDING_SEEN';

  const OnboardingLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<bool> setOnboardingSeen() async {
    return await sharedPreferences.setBool(_key, true);
  }

  @override
  Future<bool> isOnboardingSeen() async {
    return sharedPreferences.getBool(_key) ?? false;
  }
}