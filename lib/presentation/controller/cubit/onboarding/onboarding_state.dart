import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class OnboardingState {}
class OnboardingInitial extends OnboardingState {}
class OnboardingPageChanged extends OnboardingState {
  final int currentPage;
  OnboardingPageChanged(this.currentPage);
}
class OnboardingCompleted extends OnboardingState {}

class OnboardingCubit extends Cubit<OnboardingState> {
  final SharedPreferences sharedPreferences;
  int currentPage = 0;

  OnboardingCubit({required this.sharedPreferences}) : super(OnboardingInitial());

  void onPageChanged(int index) {
    currentPage = index;
    emit(OnboardingPageChanged(index));
  }

  Future<void> completeOnboarding() async {
    await sharedPreferences.setBool('IS_ONBOARDING_SEEN', true);
    emit(OnboardingCompleted());
  }
}