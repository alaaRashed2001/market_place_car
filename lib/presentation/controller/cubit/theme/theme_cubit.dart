import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_place_car/domain/usecases/theme/get_theme_usecase.dart';
import 'package:market_place_car/domain/usecases/theme/save_theme_usecase.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  final GetThemeUseCase getThemeUseCase;
  final SaveThemeUseCase saveThemeUseCase;

  ThemeCubit({
    required this.getThemeUseCase,
    required this.saveThemeUseCase,
  }) : super(const ThemeLightState());

  /// Called once on app start to load saved theme
  Future<void> loadSavedTheme() async {
    final isDark = await getThemeUseCase();
    isDark ? emit(const ThemeDarkState()) : emit(const ThemeLightState());
  }

  /// Toggle and persist theme
  Future<void> toggleTheme() async {
    final isDark = !state.isDark;
    await saveThemeUseCase(isDark);
    isDark ? emit(const ThemeDarkState()) : emit(const ThemeLightState());
  }
}