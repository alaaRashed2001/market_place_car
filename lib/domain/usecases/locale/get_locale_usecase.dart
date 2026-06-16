import 'package:market_place_car/domain/entities/locale/locale_entity.dart';
import 'package:market_place_car/domain/repositories/locale/locale_repository.dart';

class GetLocaleUseCase {
  final LocaleRepository _repository;
  const GetLocaleUseCase(this._repository);

  Future<LocaleEntity> call() => _repository.getSavedLocale();
}
