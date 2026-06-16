import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_place_car/domain/entities/auth/user_entity.dart';
import 'package:market_place_car/domain/usecases/auth/forgot_password_usecase.dart';
import 'package:market_place_car/domain/usecases/auth/login_usecase.dart';
import 'package:market_place_car/domain/usecases/auth/reset_password_usecase.dart';
import 'package:market_place_car/domain/usecases/auth/sign_up_usecase.dart';
import 'package:market_place_car/domain/usecases/auth/verify_otp_usecase.dart';
import 'package:market_place_car/domain/usecases/auth/verify_signup_otp_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase _loginUseCase;
  final ForgotPasswordUseCase _forgotPasswordUseCase;
  final VerifyOtpUseCase _verifyOtpUseCase;
  final ResetPasswordUseCase _resetPasswordUseCase;
  final SignUpUseCase _signUpUseCase;
  final VerifySignUpOtpUseCase _verifySignUpOtpUseCase;

  AuthBloc({
    required LoginUseCase loginUseCase,
    required ForgotPasswordUseCase forgotPasswordUseCase,
    required VerifyOtpUseCase verifyOtpUseCase,
    required ResetPasswordUseCase resetPasswordUseCase,
    required SignUpUseCase signUpUseCase,
    required VerifySignUpOtpUseCase verifySignUpOtpUseCase,
  })  : _loginUseCase = loginUseCase,
        _forgotPasswordUseCase = forgotPasswordUseCase,
        _verifyOtpUseCase = verifyOtpUseCase,
        _resetPasswordUseCase = resetPasswordUseCase,
        _signUpUseCase = signUpUseCase,
        _verifySignUpOtpUseCase = verifySignUpOtpUseCase,
        super(AuthInitial()) {
    on<LoginRequested>(_onLogin);
    on<ForgotPasswordRequested>(_onForgotPassword);
    on<OtpVerificationRequested>(_onVerifyOtp);
    on<ResetPasswordRequested>(_onResetPassword);
    on<SignUpRequested>(_onSignUp);
  }

  Future<void> _onLogin(LoginRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await _loginUseCase(
      phoneNumber: event.phoneNumber,
      password: event.password,
    );
    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (user) => emit(LoginSuccess(user)),
    );
  }

  Future<void> _onForgotPassword(
      ForgotPasswordRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result =
        await _forgotPasswordUseCase(phoneNumber: event.phoneNumber);
    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (_) => emit(ForgotPasswordOtpSent(event.phoneNumber)),
    );
  }

  Future<void> _onVerifyOtp(
      OtpVerificationRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final useCase = event.purpose == OtpPurpose.forgotPassword
        ? _verifyOtpUseCase(
            phoneNumber: event.phoneNumber, otp: event.otp)
        : _verifySignUpOtpUseCase(
            phoneNumber: event.phoneNumber, otp: event.otp);
    final result = await useCase;
    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (_) => emit(OtpVerified(
          purpose: event.purpose, phoneNumber: event.phoneNumber)),
    );
  }

  Future<void> _onResetPassword(
      ResetPasswordRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await _resetPasswordUseCase(
      phoneNumber: event.phoneNumber,
      newPassword: event.newPassword,
    );
    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (_) => emit(PasswordResetSuccess()),
    );
  }

  Future<void> _onSignUp(
      SignUpRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await _signUpUseCase(
      fullName: event.fullName,
      email: event.email,
      phoneNumber: event.phoneNumber,
      password: event.password,
    );
    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (user) => emit(SignUpOtpSent(event.phoneNumber)),
    );
  }
}
