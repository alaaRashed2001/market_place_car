import 'package:market_place_car/domain/repositories/onboarding/onboarding_repository.dart';

class IsOnboardingSeenUseCase {
  final OnboardingRepository repository;

  const IsOnboardingSeenUseCase({required this.repository});

  Future<bool> call() => repository.isOnboardingSeen();
}
