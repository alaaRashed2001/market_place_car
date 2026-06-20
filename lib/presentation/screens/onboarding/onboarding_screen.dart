import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_place_car/core/constants/app_images.dart';
import 'package:market_place_car/core/extension/app_sizes.dart';
import 'package:market_place_car/core/global/localization/locale/app_localizations_setup.dart';
import 'package:market_place_car/presentation/components/shared_component/app_primary_button.dart';
import 'package:market_place_car/presentation/components/shared_component/app_text_button.dart';
import 'package:market_place_car/presentation/controller/cubit/onboarding/onboarding_state.dart';
import 'package:market_place_car/presentation/helper/navigator_helper.dart';
import 'package:market_place_car/presentation/screens/auth/login_screen.dart';

class OnboardingPageModel {
  final String title;
  final String description;
  final String image;

  const OnboardingPageModel({
    required this.title,
    required this.description,
    required this.image,
  });
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  static const int _slidesCount = 3;

  List<OnboardingPageModel> _getSlides(BuildContext context) {
    final l = context.l10n;
    return [
      OnboardingPageModel(
        title: l.onboarding_title_1,
        description: l.onboarding_description_1,
        image: AppImages.onboarding1,
      ),
      OnboardingPageModel(
        title: l.onboarding_title_2,
        description: l.onboarding_description_2,
        image: AppImages.onboarding2,
      ),
      OnboardingPageModel(
        title: l.onboarding_title_3,
        description: l.onboarding_description_3,
        image: AppImages.onboarding3,
      ),
    ];
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onNext(int currentPage) {
    if (currentPage < _slidesCount - 1) {
      _pageController.animateToPage(
        currentPage + 1,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final slides = _getSlides(context);
    return BlocConsumer<OnboardingCubit, OnboardingState>(
      listener: (context, state) {
        if (state is OnboardingCompleted) {
          NavigatorHelper.jump(
            context,
            screen: const LoginScreen(),
            replace: true,
          );
        }
      },
      builder: (context, state) {
        final cubit = context.read<OnboardingCubit>();
        final currentPage = cubit.currentPage;
        final isLastPage = currentPage == slides.length - 1;

        return Scaffold(
          body: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: slides.length,
                  onPageChanged: cubit.onPageChanged,
                  itemBuilder: (context, index) {
                    final slide = slides[index];
                    return Padding(
                      padding: const EdgeInsetsDirectional.only(
                        start: 20,
                        end: 20,
                        top: 124,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            slide.image,
                            fit: BoxFit.contain,
                            width: double.infinity,
                            height: 189,
                          ),
                          context.addVerticalSpace(32),
                          Text(
                            slide.title,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headlineMedium,
                            maxLines: 1,
                          ),

                          context.addVerticalSpace(24),
                          Text(
                            slide.description,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodySmall,
                            maxLines: 3,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(slides.length, (index) {
                  final isSelected = currentPage == index;
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: isSelected ? 35 : 9,
                    height: 9,
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(
                              context,
                            ).colorScheme.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(23.11),
                    ),
                  );
                }),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  start: 20,
                  end: 20,
                  top: 40,
                ),
                child: isLastPage
                    ? _buildLastPageButtons(context, cubit)
                    : _buildNavButtons(context, cubit, currentPage),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildNavButtons(
    BuildContext context,
    OnboardingCubit cubit,
    int currentPage,
  ) {
    final l = context.l10n;
    return Column(
      spacing: 16,
      children: [
        AppPrimaryButton(text: l.next, onPressed: () => _onNext(currentPage)),
        AppTextButton(text: l.skip, onPressed: cubit.completeOnboarding),
      ],
    );
  }

  Widget _buildLastPageButtons(BuildContext context, OnboardingCubit cubit) {
    final l = context.l10n;
    return Column(
      spacing: 16,
      children: [
        AppPrimaryButton(
          text: l.joinNowAsUser,
          onPressed: cubit.completeOnboarding,
        ),
        AppPrimaryButton(
          text: l.joinNowAsShowroom,
          onPressed: cubit.completeOnboarding,
        ),
        AppTextButton(text: l.skip, onPressed: cubit.completeOnboarding),
      ],
    );
  }
}
