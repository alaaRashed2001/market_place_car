import 'package:market_place_car/domain/repositories/theme/theme_repository.dart';

class GetThemeUseCase {
  final ThemeRepository repository;

  GetThemeUseCase({required this.repository});

  Future<bool> call() async {
    return await repository.getTheme();
  }
}