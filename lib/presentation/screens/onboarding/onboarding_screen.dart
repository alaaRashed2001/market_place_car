import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_place_car/core/constants/app_images.dart';
import 'package:market_place_car/core/helper/navigator_helper.dart';
import 'package:market_place_car/presentation/controller/cubit/onboarding/onboarding_cubit.dart';
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

  final List<OnboardingPageModel> _slides = [
    OnboardingPageModel(
      title: "Welcome to CarAds App",
      description:
          "CarAds is your ultimate destination for car showrooms and rental offices advertising. Whether you're a car showroom owner or looking to rent a vehicle, our platform has got you covered!",
      image: AppImages.onboarding1,
    ),
    OnboardingPageModel(
      title: "Effortless Ads Management",
      description:
          "Are you a car showroom or rental office owner? Create your special account now! Easily manage and promote your ads within a few taps. Reach a broader audience, receive inquiries with CarAds",
      image: AppImages.onboarding2,
    ),
    OnboardingPageModel(
      title: "Explore Your Options",
      description:
          "Discover a wide range of car advertisements tailored to your preferences. Browse through various car models, rental offers, and exclusive deals from local showrooms. With CarAds",
      image: AppImages.onboarding3,
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onNext(OnboardingCubit cubit, int currentPage) {
    if (currentPage < _slides.length - 1) {
      _pageController.animateToPage(
        currentPage + 1,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  void _onSkip(OnboardingCubit cubit) {
    cubit.completeOnboarding();
  }

  @override
  Widget build(BuildContext context) {
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
        final isLastPage = currentPage == _slides.length - 1;

        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              children: [
                // ── Page View ──────────────────────────────────────
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: _slides.length,
                    onPageChanged: cubit.onPageChanged,
                    itemBuilder: (context, index) {
                      final slide = _slides[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          children: [
                            const SizedBox(height: 32),
                            // Image
                            Expanded(
                              flex: 3,
                              child: Image.asset(
                                slide.image,
                                fit: BoxFit.contain,
                              ),
                            ),
                            const SizedBox(height: 32),
                            // Title
                            Text(
                              slide.title,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF1A1A2E),
                              ),
                            ),
                            const SizedBox(height: 16),
                            // Description
                            Text(
                              slide.description,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Color(0xFF6B7280),
                                height: 1.6,
                              ),
                            ),
                            const SizedBox(height: 24),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                // ── Dots Indicator ─────────────────────────────────
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(_slides.length, (index) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: currentPage == index ? 24 : 8,
                      height: 8,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        color: currentPage == index
                            ? const Color(0xFF1A1A2E)
                            : const Color(0xFFD1D5DB),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    );
                  }),
                ),

                const SizedBox(height: 32),

                // ── Bottom Buttons ─────────────────────────────────
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: isLastPage
                      ? _buildLastPageButtons(cubit)
                      : _buildNavButtons(cubit, currentPage),
                ),

                const SizedBox(height: 24),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildNavButtons(OnboardingCubit cubit, int currentPage) {
    return Column(
      children: [
        // Next Button
        SizedBox(
          width: double.infinity,
          height: 52,
          child: ElevatedButton(
            onPressed: () => _onNext(cubit, currentPage),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1A1A2E),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              'Next',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
        ),
        const SizedBox(height: 12),
        // Skip Button
        TextButton(
          onPressed: () => _onSkip(cubit),
          child: const Text(
            'Skip',
            style: TextStyle(
              fontSize: 15,
              color: Color(0xFF6B7280),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLastPageButtons(OnboardingCubit cubit) {
    return Column(
      children: [
        // Join as User
        SizedBox(
          width: double.infinity,
          height: 52,
          child: ElevatedButton(
            onPressed: () {
              cubit.completeOnboarding();
              // TODO: Navigate to RegisterUserScreen
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1A1A2E),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              'Join Now As A User',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
        ),
        const SizedBox(height: 12),
        // Join as Showroom
        SizedBox(
          width: double.infinity,
          height: 52,
          child: OutlinedButton(
            onPressed: () {
              cubit.completeOnboarding();
              // TODO: Navigate to RegisterShowroomScreen
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: const Color(0xFF1A1A2E),
              side: const BorderSide(color: Color(0xFF1A1A2E), width: 2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              'Join Now As A Showrooms',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
        ),
        const SizedBox(height: 12),
        // Skip
        TextButton(
          onPressed: () => _onSkip(cubit),
          child: const Text(
            'Skip',
            style: TextStyle(
              fontSize: 15,
              color: Color(0xFF6B7280),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
