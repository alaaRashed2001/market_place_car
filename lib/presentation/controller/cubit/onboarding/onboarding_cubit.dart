import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_place_car/domain/usecases/onboarding/set_onboarding_seen_usecase.dart';
part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  final SetOnboardingSeenUseCase setOnboardingSeenUseCase;

  OnboardingCubit({required this.setOnboardingSeenUseCase})
      : super(OnboardingInitial());

  int currentPage = 0;

  void onPageChanged(int index) {
    currentPage = index;
    emit(OnboardingPageChanged(index));
  }

  Future<void> completeOnboarding() async {
    await setOnboardingSeenUseCase();
    emit(OnboardingCompleted());
  }
}