import 'package:dio/dio.dart';
import 'package:market_place_car/core/network/api_endpoints.dart';
import 'package:market_place_car/data/datasources/auth/auth_remote_datasource.dart';
import 'package:market_place_car/data/models/auth/user_model.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio _dio;
  const AuthRemoteDataSourceImpl(this._dio);

  @override
  Future<UserModel> login({
    required String phoneNumber,
    required String password,
  }) async {
    final res = await _dio.post(
      ApiEndpoints.login,
      data: {'phone_number': phoneNumber, 'password': password},
    );
    return UserModel.fromJson(res.data['data']);
  }

  @override
  Future<void> forgotPassword({required String phoneNumber}) async {
    await _dio.post(
      ApiEndpoints.forgotPassword,
      data: {'phone_number': phoneNumber},
    );
  }

  @override
  Future<void> verifyOtp({
    required String phoneNumber,
    required String otp,
  }) async {
    await _dio.post(
      ApiEndpoints.verifyOtp,
      data: {'phone_number': phoneNumber, 'otp': otp},
    );
  }

  @override
  Future<void> resetPassword({
    required String phoneNumber,
    required String newPassword,
  }) async {
    await _dio.post(
      ApiEndpoints.resetPassword,
      data: {'phone_number': phoneNumber, 'new_password': newPassword},
    );
  }

  @override
  Future<UserModel> signUp({
    required String fullName,
    required String email,
    required String phoneNumber,
    required String password,
  }) async {
    final res = await _dio.post(
      ApiEndpoints.signUp,
      data: {
        'full_name': fullName,
        'email': email,
        'phone_number': phoneNumber,
        'password': password,
      },
    );
    return UserModel.fromJson(res.data['data']);
  }

  @override
  Future<void> verifySignUpOtp({
    required String phoneNumber,
    required String otp,
  }) async {
    await _dio.post(
      ApiEndpoints.verifySignUpOtp,
      data: {'phone_number': phoneNumber, 'otp': otp},
    );
  }
}
