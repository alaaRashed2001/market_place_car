import 'package:market_place_car/data/datasources/locale/locale_local_datasource.dart';
import 'package:market_place_car/data/models/locale/locale_model.dart';
import 'package:market_place_car/domain/entities/locale/locale_entity.dart';
import 'package:market_place_car/domain/repositories/locale/locale_repository.dart';

class LocaleRepositoryImpl implements LocaleRepository {
  final LocaleLocalDataSource _localDataSource;
  const LocaleRepositoryImpl(this._localDataSource);

  @override
  Future<LocaleEntity> getSavedLocale() async {
    final cached = await _localDataSource.getCachedLocale();
    return cached ?? LocaleEntity.english; // fallback
  }

  @override
  Future<void> saveLocale(LocaleEntity locale) async {
    final model = LocaleModel(
      languageCode: locale.languageCode,
      label: locale.label,
      isRtl: locale.isRtl,
    );
    await _localDataSource.cacheLocale(model);
  }
}
