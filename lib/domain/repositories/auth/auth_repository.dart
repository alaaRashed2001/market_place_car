import 'package:dartz/dartz.dart';
import 'package:market_place_car/domain/entities/auth/user_entity.dart';
import 'package:market_place_car/domain/failures/auth/auth_failure.dart';

abstract class AuthRepository {
  Future<Either<AuthFailure, UserEntity>> login({
    required String phoneNumber,
    required String password,
  });

  Future<Either<AuthFailure, void>> forgotPassword({
    required String phoneNumber,
  });

  Future<Either<AuthFailure, void>> verifyOtp({
    required String phoneNumber,
    required String otp,
  });

  Future<Either<AuthFailure, void>> resetPassword({
    required String phoneNumber,
    required String newPassword,
  });

  Future<Either<AuthFailure, UserEntity>> signUp({
    required String fullName,
    required String email,
    required String phoneNumber,
    required String password,
  });

  Future<Either<AuthFailure, void>> verifySignUpOtp({
    required String phoneNumber,
    required String otp,
  });

  Future<Either<AuthFailure, void>> logout();
}
