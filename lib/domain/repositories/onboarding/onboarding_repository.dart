abstract class OnboardingRepository {
  Future<bool> setOnboardingSeen();
  Future<bool> isOnboardingSeen();
}