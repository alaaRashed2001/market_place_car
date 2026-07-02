import 'package:dartz/dartz.dart';
import 'package:market_place_car/domain/failure/failure.dart';
import 'package:market_place_car/domain/repositories/auth/auth_repository.dart';
class ForgotPasswordUseCase {
  final AuthRepository _repository;
  const ForgotPasswordUseCase(this._repository);

  Future<Either<Failure, void>> call({required String phoneNumber}) =>
      _repository.forgotPassword(phoneNumber: phoneNumber);
}
