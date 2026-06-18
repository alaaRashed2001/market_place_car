import 'package:dartz/dartz.dart';
import 'package:market_place_car/domain/failure/auth_failure.dart';
import 'package:market_place_car/domain/repositories/auth/auth_repository.dart';

class VerifyOtpUseCase {
  final AuthRepository _repository;
  const VerifyOtpUseCase(this._repository);

  Future<Either<AuthFailure, void>> call({
    required String phoneNumber,
    required String otp,
  }) =>
      _repository.verifyOtp(phoneNumber: phoneNumber, otp: otp);
}
