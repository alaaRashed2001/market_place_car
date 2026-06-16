import 'package:market_place_car/data/datasources/locale/locale_local_datasource.dart';
import 'package:market_place_car/data/models/locale/locale_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleLocalDataSourceImpl implements LocaleLocalDataSource {
  final SharedPreferences _prefs;
  const LocaleLocalDataSourceImpl(this._prefs);

  @override
  Future<LocaleModel?> getCachedLocale() async {
    final code = _prefs.getString(LocaleModel.prefKey);
    if (code == null) return null;
    return LocaleModel.fromCode(code);
  }

  @override
  Future<void> cacheLocale(LocaleModel model) async {
    await _prefs.setString(LocaleModel.prefKey, model.languageCode);
  }
}
