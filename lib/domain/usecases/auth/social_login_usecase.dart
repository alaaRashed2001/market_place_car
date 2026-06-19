import 'package:dartz/dartz.dart';
import 'package:market_place_car/domain/entities/auth/user_entity.dart';
import 'package:market_place_car/domain/failure/failure.dart';
import 'package:market_place_car/domain/repositories/auth/auth_repository.dart';

class SocialLoginUseCase {
  final AuthRepository _repository;
  const SocialLoginUseCase(this._repository);

  Future<Either<Failure, UserEntity>> call({
    required String provider,
    required String token,
  }) =>
      _repository.socialLogin(provider: provider, token: token);
}
