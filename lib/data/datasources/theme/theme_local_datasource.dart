import 'package:shared_preferences/shared_preferences.dart';

abstract class ThemeLocalDataSource {
  Future<bool> saveTheme(bool isDark);
  Future<bool> getTheme();
}

class ThemeLocalDataSourceImpl implements ThemeLocalDataSource {
  final SharedPreferences sharedPreferences;

  static const String _themeKey = 'IS_DARK_THEME';

  ThemeLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<bool> saveTheme(bool isDark) async {
    return await sharedPreferences.setBool(_themeKey, isDark);
  }

  @override
  Future<bool> getTheme() async {
    return sharedPreferences.getBool(_themeKey) ?? false;
  }
}