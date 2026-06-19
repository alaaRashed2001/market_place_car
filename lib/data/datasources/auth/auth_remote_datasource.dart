import 'package:market_place_car/data/dto/auth/user_dto.dart';

abstract class AuthRemoteDataSource {
  Future<UseDto> login({
    required String phoneNumber,
    required String password,
  });

  Future<void> forgotPassword({required String phoneNumber});

  Future<void> verifyOtp({
    required String phoneNumber,
    required String otp,
  });

  Future<void> resetPassword({
    required String phoneNumber,
    required String newPassword,
  });

  Future<UseDto> signUp({
    required String fullName,
    required String email,
    required String phoneNumber,
    required String password,
  });

  Future<void> verifySignUpOtp({
    required String phoneNumber,
    required String otp,
  });

  Future<UseDto> socialLogin({
    required String provider,
    required String token,
  });
}
