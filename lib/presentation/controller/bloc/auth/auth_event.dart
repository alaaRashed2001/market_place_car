part of 'auth_bloc.dart';

abstract class AuthEvent {}

class LoginRequested extends AuthEvent {
  final String phoneNumber;
  final String password;
  LoginRequested({required this.phoneNumber, required this.password});
}

class ForgotPasswordRequested extends AuthEvent {
  final String phoneNumber;
  ForgotPasswordRequested({required this.phoneNumber});
}

class OtpVerificationRequested extends AuthEvent {
  final String phoneNumber;
  final String otp;
  final OtpPurpose purpose;
  OtpVerificationRequested({
    required this.phoneNumber,
    required this.otp,
    required this.purpose,
  });
}

class ResetPasswordRequested extends AuthEvent {
  final String phoneNumber;
  final String newPassword;
  ResetPasswordRequested({
    required this.phoneNumber,
    required this.newPassword,
  });
}

class SignUpRequested extends AuthEvent {
  final String fullName;
  final String email;
  final String phoneNumber;
  final String password;
  SignUpRequested({
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.password,
  });
}

class LogoutRequested extends AuthEvent {}

enum OtpPurpose { forgotPassword, signUp }
