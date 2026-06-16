import 'package:market_place_car/domain/repositories/theme/theme_repository.dart';

class SaveThemeUseCase {
  final ThemeRepository repository;

  SaveThemeUseCase({required this.repository});

  Future<bool> call(bool isDark) async {
    return await repository.saveTheme(isDark);
  }
}