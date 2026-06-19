import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:market_place_car/data/datasources/auth/auth_local_data_source.dart';
import 'package:market_place_car/data/datasources/auth/auth_remote_datasource.dart';
import 'package:market_place_car/data/datasources/auth/auth_remote_datasource_impl.dart';
import 'package:market_place_car/data/repositories/auth/auth_repository_impl.dart';
import 'package:market_place_car/domain/repositories/auth/auth_repository.dart';
import 'package:market_place_car/domain/usecases/auth/forgot_password_usecase.dart';
import 'package:market_place_car/domain/usecases/auth/login_usecase.dart';
import 'package:market_place_car/domain/usecases/auth/sign_up_usecase.dart';
import 'package:market_place_car/domain/usecases/auth/verify_otp_usecase.dart';
import 'package:market_place_car/domain/usecases/auth/social_login_usecase.dart';
import 'package:market_place_car/domain/usecases/auth/reset_password_usecase.dart';
import 'package:market_place_car/presentation/controller/cubit/auth/auth_cubit.dart';
import 'package:market_place_car/presentation/controller/cubit/locale/locale_state.dart';
import 'package:market_place_car/presentation/controller/cubit/onboarding/onboarding_state.dart';
import 'package:market_place_car/presentation/controller/cubit/theme/theme_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

class ServiceLocator {
  Future<void> init() async {
    // Shared Preferences
    final sharedPreferences = await SharedPreferences.getInstance();
    sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

    // Dio
    sl.registerLazySingleton<Dio>(() => Dio());

    // Cubits
    sl.registerFactory(() => ThemeCubit(sharedPreferences: sl()));
    sl.registerFactory(() => LocaleCubit(sharedPreferences: sl()));
    sl.registerFactory(() => OnboardingCubit(sharedPreferences: sl()));

    // Features - Auth
    // Cubit
    sl.registerFactory(() => AuthCubit(
      loginUseCase: sl(),
      signUpUseCase: sl(),
      forgotPasswordUseCase: sl(),
      verifyOTPUseCase: sl(),
      socialLoginUseCase: sl(),
      resetPasswordUseCase: sl(),
    ));

    // Use cases
    sl.registerLazySingleton(() => LoginUseCase(sl()));
    sl.registerLazySingleton(() => SignUpUseCase(sl()));
    sl.registerLazySingleton(() => ForgotPasswordUseCase(sl()));
    sl.registerLazySingleton(() => VerifyOtpUseCase(sl()));
    sl.registerLazySingleton(() => SocialLoginUseCase(sl()));
    sl.registerLazySingleton(() => ResetPasswordUseCase(sl()));

    // Repository
    sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
    ));

    // Data sources
    sl.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(sl()));
    sl.registerLazySingleton<AuthLocalDataSource>(() => AuthLocalDataSourceImpl(sl()));
  }
}
