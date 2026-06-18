
import 'package:market_place_car/data/dto/auth/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login({
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

  Future<UserModel> signUp({
    required String fullName,
    required String email,
    required String phoneNumber,
    required String password,
  });

  Future<void> verifySignUpOtp({
    required String phoneNumber,
    required String otp,
  });
}
