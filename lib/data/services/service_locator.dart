import 'package:get_it/get_it.dart';
import 'package:market_place_car/presentation/controller/cubit/locale/locale_state.dart';
import 'package:market_place_car/presentation/controller/cubit/onboarding/onboarding_state.dart';
import 'package:market_place_car/presentation/controller/cubit/theme/theme_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

class ServiceLocator {
  Future<void> init() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

    sl.registerFactory(() => ThemeCubit(sharedPreferences: sl()));
    sl.registerFactory(() => LocaleCubit(sharedPreferences: sl()));
    sl.registerFactory(() => OnboardingCubit(sharedPreferences: sl()));
  }
}
