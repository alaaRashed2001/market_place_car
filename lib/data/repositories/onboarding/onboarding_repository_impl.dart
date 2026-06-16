
import 'package:market_place_car/data/datasources/onboarding/onboarding_local_datasource.dart';
import 'package:market_place_car/domain/repositories/onboarding/onboarding_repository.dart';

class OnboardingRepositoryImpl implements OnboardingRepository {
  final OnboardingLocalDataSource localDataSource;

  const OnboardingRepositoryImpl({required this.localDataSource});

  @override
  Future<bool> setOnboardingSeen() => localDataSource.setOnboardingSeen();

  @override
  Future<bool> isOnboardingSeen() => localDataSource.isOnboardingSeen();
}