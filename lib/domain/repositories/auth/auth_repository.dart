import 'package:dartz/dartz.dart';
import 'package:market_place_car/domain/entities/auth/user_entity.dart';
import 'package:market_place_car/domain/failure/failure.dart';
abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> login({
    required String phoneNumber,
    required String password,
  });

  Future<Either<Failure, void>> forgotPassword({
    required String phoneNumber,
  });

  Future<Either<Failure, void>> verifyOtp({
    required String phoneNumber,
    required String otp,
  });

  Future<Either<Failure, void>> resetPassword({
    required String phoneNumber,
    required String newPassword,
  });

  Future<Either<Failure, UserEntity>> signUp({
    required String fullName,
    required String email,
    required String phoneNumber,
    required String password,
  });

  Future<Either<Failure, void>> verifySignUpOtp({
    required String phoneNumber,
    required String otp,
  });

  Future<Either<Failure, void>> saveToken(String token);
  Future<Either<Failure, String?>> getToken();

  Future<Either<Failure, void>> logout();

  Future<Either<Failure, UserEntity>> socialLogin({
    required String provider,
    required String token,
  });
}

