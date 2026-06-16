import 'package:market_place_car/data/models/locale/locale_model.dart';

abstract class LocaleLocalDataSource {
  Future<LocaleModel?> getCachedLocale();
  Future<void> cacheLocale(LocaleModel model);
}
