import 'package:dartz/dartz.dart';
import 'package:market_place_car/domain/entities/auth/user_entity.dart';
import 'package:market_place_car/domain/failure/auth_failure.dart';
import 'package:market_place_car/domain/repositories/auth/auth_repository.dart' show AuthRepository;
class LoginUseCase {
  final AuthRepository _repository;
  const LoginUseCase(this._repository);

  Future<Either<AuthFailure, UserEntity>> call({
    required String phoneNumber,
    required String password,
  }) =>
      _repository.login(phoneNumber: phoneNumber, password: password);
}
