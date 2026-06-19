import 'package:market_place_car/domain/entities/auth/user_entity.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}
class AuthLoading extends AuthState {}

class LoginSuccess extends AuthState {
  final UserEntity user;
  LoginSuccess(this.user);
}

class SignUpSuccess extends AuthState {
  final UserEntity user;
  SignUpSuccess(this.user);
}

class ForgotPasswordSuccess extends AuthState {}

class OTPSuccess extends AuthState {
  final UserEntity? user;
  OTPSuccess([this.user]);
}

class AuthError extends AuthState {
  final String message;
  AuthError(this.message);
}