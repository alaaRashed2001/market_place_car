import 'package:market_place_car/domain/entities/locale/locale_entity.dart';

class LocaleModel extends LocaleEntity {
  const LocaleModel({
    required super.languageCode,
    required super.label,
    required super.isRtl,
  });

  factory LocaleModel.fromCode(String code) {
    final entity = LocaleEntity.fromCode(code);
    return LocaleModel(
      languageCode: entity.languageCode,
      label: entity.label,
      isRtl: entity.isRtl,
    );
  }



  static const String prefKey = 'app_locale';
}
