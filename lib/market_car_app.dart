import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_place_car/core/global/theme/theme_data/app_theme.dart';
import 'package:market_place_car/core/routing/app_router.dart';
import 'package:market_place_car/core/routing/routes.dart';
import 'package:market_place_car/data/services/service_locator.dart';
import 'package:market_place_car/presentation/controller/cubit/auth/auth_cubit.dart';
import 'package:market_place_car/presentation/controller/cubit/locale/locale_state.dart';
import 'package:market_place_car/presentation/controller/cubit/onboarding/onboarding_state.dart';
import 'package:market_place_car/presentation/controller/cubit/theme/theme_state.dart';
import 'core/extension/app_sizes.dart';
import 'core/global/localization/locale/app_localizations_setup.dart';

class MarketCarApp extends StatelessWidget {
  final AppRouter appRouter;
  const MarketCarApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<ThemeCubit>()..loadSavedTheme()),
        BlocProvider(create: (_) => sl<LocaleCubit>()..loadSavedLocale()),
        BlocProvider(create: (_) => sl<OnboardingCubit>()),
        BlocProvider(create: (_) => sl<AuthCubit>()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, themeState) {
          return BlocBuilder<LocaleCubit, LocaleState>(
            builder: (context, localeState) {
              final locale = localeState is LocaleLoaded
                  ? localeState.locale.toLocale()
                  : const Locale('en');

              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Market Place Car',
                navigatorKey: navigatorKey,
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,
                themeMode: themeState.isDark ? ThemeMode.dark : ThemeMode.light,
                locale: locale,
                localizationsDelegates: appLocalizationDelegates,
                supportedLocales: appSupportedLocales,
                initialRoute: Routes.splashScreen,
                onGenerateRoute: appRouter.generateRoute,
                builder: (context, child) {
                  final isAndroid = Theme.of(context).platform == TargetPlatform.android;

                  return SafeArea(
                    top: true,
                    left: true,
                    right: true,
                    bottom: isAndroid,
                    child: child ?? const SizedBox(),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
