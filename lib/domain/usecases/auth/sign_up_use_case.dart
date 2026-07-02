import 'package:dartz/dartz.dart';
import 'package:market_place_car/domain/entities/auth/user_entity.dart';
import 'package:market_place_car/domain/failure/failure.dart';
import 'package:market_place_car/domain/repositories/auth/auth_repository.dart';

class SignUpUseCase {
  final AuthRepository _repository;
  const SignUpUseCase(this._repository);

  Future<Either<Failure, UserEntity>> call({
    required String fullName,
    required String email,
    required String phoneNumber,
    required String password,
  }) =>
      _repository.signUp(
        fullName: fullName,
        email: email,
        phoneNumber: phoneNumber,
        password: password,
      );
}
