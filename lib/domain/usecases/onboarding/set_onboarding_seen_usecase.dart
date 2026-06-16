import 'package:market_place_car/domain/repositories/onboarding/onboarding_repository.dart';

class SetOnboardingSeenUseCase {
  final OnboardingRepository repository;

  const SetOnboardingSeenUseCase({required this.repository});

  Future<bool> call() => repository.setOnboardingSeen();
}