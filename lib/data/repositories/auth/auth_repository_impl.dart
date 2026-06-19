import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:market_place_car/data/datasources/auth/auth_local_data_source.dart';
import 'package:market_place_car/data/datasources/auth/auth_remote_datasource.dart';
import 'package:market_place_car/domain/entities/auth/user_entity.dart';
import 'package:market_place_car/domain/failure/failure.dart';
import 'package:market_place_car/domain/repositories/auth/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;

  const AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, UserEntity>> login({
    required String phoneNumber,
    required String password,
  }) async {
    try {
      final user = await remoteDataSource.login(
        phoneNumber: phoneNumber,
        password: password,
      );
      return Right(user);
    } on DioException catch (e) {
      return Left(_mapDioError(e));
    }
  }

  @override
  Future<Either<Failure, void>> forgotPassword({
    required String phoneNumber,
  }) async {
    try {
      await remoteDataSource.forgotPassword(phoneNumber: phoneNumber);
      return const Right(null);
    } on DioException catch (e) {
      return Left(_mapDioError(e));
    }
  }

  @override
  Future<Either<Failure, void>> verifyOtp({
    required String phoneNumber,
    required String otp,
  }) async {
    try {
      await remoteDataSource.verifyOtp(phoneNumber: phoneNumber, otp: otp);
      return const Right(null);
    } on DioException catch (e) {
      return Left(_mapDioError(e));
    }
  }

  @override
  Future<Either<Failure, void>> resetPassword({
    required String phoneNumber,
    required String newPassword,
  }) async {
    try {
      await remoteDataSource.resetPassword(
        phoneNumber: phoneNumber,
        newPassword: newPassword,
      );
      return const Right(null);
    } on DioException catch (e) {
      return Left(_mapDioError(e));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signUp({
    required String fullName,
    required String email,
    required String phoneNumber,
    required String password,
  }) async {
    try {
      final user = await remoteDataSource.signUp(
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
  Future<Either<Failure, void>> verifySignUpOtp({
    required String phoneNumber,
    required String otp,
  }) async {
    try {
      await remoteDataSource.verifySignUpOtp(
        phoneNumber: phoneNumber,
        otp: otp,
      );
      return const Right(null);
    } on DioException catch (e) {
      return Left(_mapDioError(e));
    }
  }

  @override
  Future<Either<Failure, void>> saveToken(String token) async {
    try {
      await localDataSource.cacheToken(token);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String?>> getToken() async {
    try {
      final token = await localDataSource.getToken();
      return Right(token);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      // Clear token upon logout
      await localDataSource.cacheToken('');
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> socialLogin({
    required String provider,
    required String token,
  }) async {
    try {
      final user = await remoteDataSource.socialLogin(
        provider: provider,
        token: token,
      );
      return Right(user);
    } on DioException catch (e) {
      return Left(_mapDioError(e));
    }
  }

  Failure _mapDioError(DioException e) {
    if (e.type == DioExceptionType.connectionError) {
      return NetworkFailure('No internet connection.');
    }
    final statusCode = e.response?.statusCode;
    if (statusCode == 401) {
      return InvalidCredentialsFailure('Invalid phone number or password.');
    }
    if (statusCode == 404) {
      return PhoneNotFoundFailure('Phone number not found.');
    }
    if (statusCode == 400) {
      final msg = e.response?.data?['message']?.toString();
      if (msg != null && msg.toLowerCase().contains('otp')) {
        return OtpInvalidFailure("");
      }
    }
    return ServerFailure(e.message ?? 'Unknown error');
  }
}
