import 'package:market_place_car/domain/entities/locale/locale_entity.dart';
import 'package:market_place_car/domain/repositories/locale/locale_repository.dart';

class ChangeLocaleUseCase {
  final LocaleRepository _repository;
  const ChangeLocaleUseCase(this._repository);

  Future<void> call(LocaleEntity locale) => _repository.saveLocale(locale);
}
