import 'package:dartz/dartz.dart';
import 'package:market_place_car/domain/failure/failure.dart';
import 'package:market_place_car/domain/repositories/auth/auth_repository.dart';

class VerifySignUpOtpUseCase {
  final AuthRepository _repository;
  const VerifySignUpOtpUseCase(this._repository);

  Future<Either<Failure, void>> call({
    required String phoneNumber,
    required String otp,
  }) =>
      _repository.verifySignUpOtp(phoneNumber: phoneNumber, otp: otp);
}
