import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:market_place_car/data/datasources/auth/auth_remote_datasource.dart';
import 'package:market_place_car/domain/entities/auth/user_entity.dart';
import 'package:market_place_car/domain/failures/auth/auth_failure.dart';
import 'package:market_place_car/domain/repositories/auth/auth_repository.dart';
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  const AuthRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<AuthFailure, UserEntity>> login({
    required String phoneNumber,
    required String password,
  }) async {
    try {
      final user = await _remoteDataSource.login(
        phoneNumber: phoneNumber,
        password: password,
      );
      return Right(user);
    } on DioException catch (e) {
      return Left(_mapDioError(e));
    }
  }

  @override
  Future<Either<AuthFailure, void>> forgotPassword({
    required String phoneNumber,
  }) async {
    try {
      await _remoteDataSource.forgotPassword(phoneNumber: phoneNumber);
      return const Right(null);
    } on DioException catch (e) {
      return Left(_mapDioError(e));
    }
  }

  @override
  Future<Either<AuthFailure, void>> verifyOtp({
    required String phoneNumber,
    required String otp,
  }) async {
    try {
      await _remoteDataSource.verifyOtp(phoneNumber: phoneNumber, otp: otp);
      return const Right(null);
    } on DioException catch (e) {
      return Left(_mapDioError(e));
    }
  }

  @override
  Future<Either<AuthFailure, void>> resetPassword({
    required String phoneNumber,
    required String newPassword,
  }) async {
    try {
      await _remoteDataSource.resetPassword(
        phoneNumber: phoneNumber,
        newPassword: newPassword,
      );
      return const Right(null);
    } on DioException catch (e) {
      return Left(_mapDioError(e));
    }
  }

  @override
  Future<Either<AuthFailure, UserEntity>> signUp({
    required String fullName,
    required String email,
    required String phoneNumber,
    required String password,
  }) async {
    try {
      final user = await _remoteDataSource.signUp(
        fullName: fullName,
        email: email,
        phoneNumber: phoneNumber,
        password: password,
      );
      return Right(user);
    } on DioException catch (e) {
      return Left(_mapDioError(e));
    }
  }

  @override
  Future<Either<AuthFailure, void>> verifySignUpOtp({
    required String phoneNumber,
    required String otp,
  }) async {
    try {
      await _remoteDataSource.verifySignUpOtp(
        phoneNumber: phoneNumber,
        otp: otp,
      );
      return const Right(null);
    } on DioException catch (e) {
      return Left(_mapDioError(e));
    }
  }

  @override
  Future<Either<AuthFailure, void>> logout() async {
    return const Right(null);
  }

  AuthFailure _mapDioError(DioException e) {
    if (e.type == DioExceptionType.connectionError) return const NetworkFailure();
    final statusCode = e.response?.statusCode;
    if (statusCode == 401) return const InvalidCredentialsFailure();
    if (statusCode == 404) return const PhoneNotFoundFailure();
    return ServerFailure(e.message ?? 'Unknown error');
  }
}
