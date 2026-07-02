import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_place_car/domain/usecases/auth/forgot_password_use_case.dart';
import 'package:market_place_car/domain/usecases/auth/login_use_case.dart';
import 'package:market_place_car/domain/usecases/auth/sign_up_use_case.dart';
import 'package:market_place_car/domain/usecases/auth/verify_otp_use_case.dart';
import 'package:market_place_car/domain/usecases/auth/social_login_use_case.dart';
import 'package:market_place_car/domain/usecases/auth/reset_password_use_case.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginUseCase loginUseCase;
  final SignUpUseCase signUpUseCase;
  final ForgotPasswordUseCase forgotPasswordUseCase;
  final VerifyOtpUseCase verifyOTPUseCase;
  final SocialLoginUseCase socialLoginUseCase;
  final ResetPasswordUseCase resetPasswordUseCase;

  AuthCubit({
    required this.loginUseCase,
    required this.signUpUseCase,
    required this.forgotPasswordUseCase,
    required this.verifyOTPUseCase,
    required this.socialLoginUseCase,
    required this.resetPasswordUseCase,
  }) : super(AuthInitial());

  Future<void> login({
    required String phoneNumber,
    required String password,
  }) async {
    emit(AuthLoading());
    final result = await loginUseCase(
      phoneNumber: phoneNumber,
      password: password,
    );
    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (user) => emit(LoginSuccess(user)),
    );
  }

  Future<void> signUp({
    required String fullName,
    required String email,
    required String phoneNumber,
    required String password,
  }) async {
    emit(AuthLoading());
    final result = await signUpUseCase(
      fullName: fullName,
      email: email,
      phoneNumber: phoneNumber,
      password: password,
    );
    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (user) => emit(SignUpSuccess(user)),
    );
  }

  Future<void> forgotPassword({required String phoneNumber}) async {
    emit(AuthLoading());
    final result = await forgotPasswordUseCase(phoneNumber: phoneNumber);
    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (_) => emit(ForgotPasswordSuccess()),
    );
  }

  Future<void> verifyOTP({
    required String phoneNumber,
    required String otp,
  }) async {
    emit(AuthLoading());
    final result = await verifyOTPUseCase(phoneNumber: phoneNumber, otp: otp);
    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (_) => emit(OTPSuccess()),
    );
  }

  Future<void> socialLogin({
    required String provider,
    required String token,
  }) async {
    emit(AuthLoading());
    final result = await socialLoginUseCase(provider: provider, token: token);
    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (user) => emit(LoginSuccess(user)),
    );
  }

  Future<void> resetPassword({
    required String phoneNumber,
    required String newPassword,
  }) async {
    emit(AuthLoading());
    final result = await resetPasswordUseCase(
      phoneNumber: phoneNumber,
      newPassword: newPassword,
    );
    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (_) => emit(AuthInitial()),
    );
  }

  void logout() {
    emit(AuthInitial());
  }
}