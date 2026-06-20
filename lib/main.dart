import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_place_car/core/global/localization/locale/app_localizations_setup.dart';
import 'package:market_place_car/core/global/theme/theme_data/app_theme.dart';
import 'package:market_place_car/data/services/service_locator.dart';
import 'package:market_place_car/presentation/controller/cubit/auth/auth_cubit.dart';
import 'package:market_place_car/presentation/controller/cubit/locale/locale_state.dart';
import 'package:market_place_car/presentation/controller/cubit/onboarding/onboarding_state.dart';
import 'package:market_place_car/presentation/controller/cubit/theme/theme_state.dart';
import 'package:market_place_car/presentation/screens/main_screen.dart';
import 'package:market_place_car/presentation/screens/onboarding/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ServiceLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,
                themeMode: themeState.isDark ? ThemeMode.dark : ThemeMode.light,
                locale: locale,
                localizationsDelegates: appLocalizationDelegates,
                supportedLocales: appSupportedLocales,
                home: const MainScreen(),
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
