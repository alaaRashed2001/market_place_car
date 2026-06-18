import 'package:dartz/dartz.dart';
import 'package:market_place_car/domain/failure/auth_failure.dart';
import 'package:market_place_car/domain/repositories/auth/auth_repository.dart';
class ResetPasswordUseCase {
  final AuthRepository _repository;
  const ResetPasswordUseCase(this._repository);

  Future<Either<AuthFailure, void>> call({
    required String phoneNumber,
    required String newPassword,
  }) =>
      _repository.resetPassword(phoneNumber: phoneNumber, newPassword: newPassword);
}
