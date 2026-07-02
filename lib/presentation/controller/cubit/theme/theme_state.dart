import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

// --- Theme States ---
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

class ThemeCubit extends Cubit<ThemeState> {
  final SharedPreferences sharedPreferences;
  static const String _themeKey = 'IS_DARK_THEME';

  ThemeCubit({required this.sharedPreferences})
    : super(const ThemeLightState());

  void loadSavedTheme() {
    final isDark = sharedPreferences.getBool(_themeKey) ?? false;
    isDark ? emit(const ThemeDarkState()) : emit(const ThemeLightState());
  }

  Future<void> toggleTheme() async {
    final currentIsDark = state.isDark;
    final nextIsDark = !currentIsDark;

    await sharedPreferences.setBool(_themeKey, nextIsDark);
    nextIsDark ? emit(const ThemeDarkState()) : emit(const ThemeLightState());
  }
}
