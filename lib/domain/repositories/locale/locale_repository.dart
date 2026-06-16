import 'package:market_place_car/domain/entities/locale/locale_entity.dart';

abstract class LocaleRepository {

  Future<LocaleEntity> getSavedLocale();

  Future<void> saveLocale(LocaleEntity locale);
}
