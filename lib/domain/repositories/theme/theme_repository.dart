abstract class ThemeRepository {
  Future<bool> saveTheme(bool isDark);
  Future<bool> getTheme();
}