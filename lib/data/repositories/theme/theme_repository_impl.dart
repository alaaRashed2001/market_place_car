import 'package:market_place_car/data/datasources/theme/theme_local_datasource.dart';
import 'package:market_place_car/domain/repositories/theme/theme_repository.dart';

class ThemeRepositoryImpl implements ThemeRepository {
  final ThemeLocalDataSource localDataSource;

  ThemeRepositoryImpl({required this.localDataSource});

  @override
  Future<bool> saveTheme(bool isDark) async {
    return await localDataSource.saveTheme(isDark);
  }

  @override
  Future<bool> getTheme() async {
    return await localDataSource.getTheme();
  }
}