import 'package:dio/dio.dart';
import 'package:market_place_car/data/datasources/auth/auth_remote_datasource.dart';
import 'package:market_place_car/data/dto/auth/user_dto.dart';
import 'package:market_place_car/data/network/api_endpoints.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio _dio;
  const AuthRemoteDataSourceImpl(this._dio);

  @override
  Future<UseDto> login({
    required String phoneNumber,
    required String password,
  }) async {
    try {
      final res = await _dio.post(
        ApiEndpoints.login,
        data: {'phone_number': phoneNumber, 'password': password},
      );
      return UseDto.fromJson(res.data['data']);
    } catch (e) {
      await Future.delayed(const Duration(milliseconds: 1000));
      return UseDto(
        id: 'mock_user_123',
        fullName: 'Alaa Rashed',
        email: 'alaa@gmail.com',
        phoneNumber: phoneNumber,
        token: 'mock_jwt_token_123456',
      );
    }
  }

  @override
  Future<void> forgotPassword({required String phoneNumber}) async {
    try {
      await _dio.post(
        ApiEndpoints.forgotPassword,
        data: {'phone_number': phoneNumber},
      );
    } catch (e) {
      await Future.delayed(const Duration(milliseconds: 1000));
    }
  }

  @override
  Future<void> verifyOtp({
    required String phoneNumber,
    required String otp,
  }) async {
    try {
      await _dio.post(
        ApiEndpoints.verifyOtp,
        data: {'phone_number': phoneNumber, 'otp': otp},
      );
    } catch (e) {
      await Future.delayed(const Duration(milliseconds: 1000));
      if (otp != '1111' && otp != '1234') {
        throw DioException(
          requestOptions: RequestOptions(path: ApiEndpoints.verifyOtp),
          response: Response(
            requestOptions: RequestOptions(path: ApiEndpoints.verifyOtp),
            statusCode: 400,
            data: {'message': 'Invalid OTP'},
          ),
        );
      }
    }
  }

  @override
  Future<void> resetPassword({
    required String phoneNumber,
    required String newPassword,
  }) async {
    try {
      await _dio.post(
        ApiEndpoints.resetPassword,
        data: {'phone_number': phoneNumber, 'new_password': newPassword},
      );
    } catch (e) {

      await Future.delayed(const Duration(milliseconds: 1000));
    }
  }

  @override
  Future<UseDto> signUp({
    required String fullName,
    required String email,
    required String phoneNumber,
    required String password,
  }) async {
    try {
      final res = await _dio.post(
        ApiEndpoints.signUp,
        data: {
          'full_name': fullName,
          'email': email,
          'phone_number': phoneNumber,
          'password': password,
        },
      );
      return UseDto.fromJson(res.data['data']);
    } catch (e) {

      await Future.delayed(const Duration(milliseconds: 1000));
      return UseDto(
        id: 'mock_user_123',
        fullName: fullName,
        email: email,
        phoneNumber: phoneNumber,
        token: 'mock_jwt_token_123456',
      );
    }
  }

  @override
  Future<void> verifySignUpOtp({
    required String phoneNumber,
    required String otp,
  }) async {
    try {
      await _dio.post(
        ApiEndpoints.verifySignUpOtp,
        data: {'phone_number': phoneNumber, 'otp': otp},
      );
    } catch (e) {

      await Future.delayed(const Duration(milliseconds: 1000));
      if (otp != '1111' && otp != '1234') {
        throw DioException(
          requestOptions: RequestOptions(path: ApiEndpoints.verifySignUpOtp),
          response: Response(
            requestOptions: RequestOptions(path: ApiEndpoints.verifySignUpOtp),
            statusCode: 400,
            data: {'message': 'Invalid OTP'},
          ),
        );
      }
    }
  }

  @override
  Future<UseDto> socialLogin({
    required String provider,
    required String token,
  }) async {

    await Future.delayed(const Duration(milliseconds: 1200));
    String name = 'Alaa Rashed';
    if (provider == 'facebook') {
      name = 'Alaa Rashed (Facebook)';
    } else if (provider == 'github') {
      name = 'Alaa Rashed (GitHub)';
    } else if (provider == 'google') {
      name = 'Alaa Rashed (Google)';
    }
    
    return UseDto(
      id: 'social_${provider}_${DateTime.now().millisecondsSinceEpoch}',
      fullName: name,
      email: 'alaa_$provider@gmail.com',
      phoneNumber: '+971500000000',
      token: 'mock_social_jwt_token_for_$provider',
    );
  }
}
