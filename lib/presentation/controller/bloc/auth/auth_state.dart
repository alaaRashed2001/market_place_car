part of 'auth_bloc.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class LoginSuccess extends AuthState {
  final UserEntity user;
  LoginSuccess(this.user);
}

class ForgotPasswordOtpSent extends AuthState {
  final String phoneNumber;
  ForgotPasswordOtpSent(this.phoneNumber);
}

class OtpVerified extends AuthState {
  final OtpPurpose purpose;
  final String phoneNumber;
  OtpVerified({required this.purpose, required this.phoneNumber});
}

class PasswordResetSuccess extends AuthState {}

class SignUpOtpSent extends AuthState {
  final String phoneNumber;
  SignUpOtpSent(this.phoneNumber);
}

class SignUpSuccess extends AuthState {
  final UserEntity user;
  SignUpSuccess(this.user);
}

class AuthError extends AuthState {
  final String message;
  AuthError(this.message);
}
