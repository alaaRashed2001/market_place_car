import 'package:get_it/get_it.dart';
import 'package:market_place_car/data/datasources/locale/locale_local_datasource.dart';
import 'package:market_place_car/data/datasources/locale/locale_local_datasource_impl.dart';
import 'package:market_place_car/data/repositories/locale/locale_repository_impl.dart';
import 'package:market_place_car/domain/repositories/locale/locale_repository.dart';
import 'package:market_place_car/domain/usecases/locale/change_locale_usecase.dart';
import 'package:market_place_car/domain/usecases/locale/get_locale_usecase.dart';
import 'package:market_place_car/presentation/controller/bloc/locale/locale_bloc.dart';
import 'package:market_place_car/presentation/controller/cubit/onboarding/onboarding_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:market_place_car/data/datasources/theme/theme_local_datasource.dart';
import 'package:market_place_car/data/repositories/theme/theme_repository_impl.dart';
import 'package:market_place_car/domain/repositories/theme/theme_repository.dart';
import 'package:market_place_car/domain/usecases/theme/get_theme_usecase.dart';
import 'package:market_place_car/domain/usecases/theme/save_theme_usecase.dart';
import 'package:market_place_car/presentation/controller/cubit/theme/theme_cubit.dart';
import 'package:market_place_car/data/datasources/onboarding/onboarding_local_datasource.dart';
import 'package:market_place_car/data/repositories/onboarding/onboarding_repository_impl.dart';
import 'package:market_place_car/domain/repositories/onboarding/onboarding_repository.dart';
import 'package:market_place_car/domain/usecases/onboarding/is_onboarding_seen_usecase.dart';
import 'package:market_place_car/domain/usecases/onboarding/set_onboarding_seen_usecase.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  // ── External ───────────────────────────────────────────────────
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  // ── Theme ──────────────────────────────────────────────────────
  sl.registerLazySingleton<ThemeLocalDataSource>(
    () => ThemeLocalDataSourceImpl(sharedPreferences: sl()),
  );
  sl.registerLazySingleton<ThemeRepository>(
    () => ThemeRepositoryImpl(localDataSource: sl()),
  );
  sl.registerLazySingleton(() => GetThemeUseCase(repository: sl()));
  sl.registerLazySingleton(() => SaveThemeUseCase(repository: sl()));
  sl.registerFactory(
    () => ThemeCubit(getThemeUseCase: sl(), saveThemeUseCase: sl()),
  );

  // ── Locale ─────────────────────────────────────────────────
  sl.registerLazySingleton<LocaleLocalDataSource>(
    () => LocaleLocalDataSourceImpl(sl()),
  );

  sl.registerLazySingleton<LocaleRepository>(() => LocaleRepositoryImpl(sl()));

  sl.registerLazySingleton(() => GetLocaleUseCase(sl()));

  sl.registerLazySingleton(() => ChangeLocaleUseCase(sl()));

  sl.registerFactory(() => LocaleBloc(getLocale: sl(), changeLocale: sl()));

  // ── Onboarding ─────────────────────────────────────────────────
  sl.registerLazySingleton<OnboardingLocalDataSource>(
    () => OnboardingLocalDataSourceImpl(sharedPreferences: sl()),
  );
  sl.registerLazySingleton<OnboardingRepository>(
    () => OnboardingRepositoryImpl(localDataSource: sl()),
  );
  sl.registerLazySingleton(() => IsOnboardingSeenUseCase(repository: sl()));
  sl.registerLazySingleton(() => SetOnboardingSeenUseCase(repository: sl()));
  sl.registerFactory(() => OnboardingCubit(setOnboardingSeenUseCase: sl()));
}
