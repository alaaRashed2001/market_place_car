part of 'theme_cubit.dart';

abstract class ThemeState {
  final bool isDark;
  const ThemeState({required this.isDark});
}

class ThemeLightState extends ThemeState {
  const ThemeLightState() : super(isDark: false);
}

class ThemeDarkState extends ThemeState {
  const ThemeDarkState() : super(isDark: true);
}