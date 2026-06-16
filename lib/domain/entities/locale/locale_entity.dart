import 'dart:ui';

class LocaleEntity {
  final String languageCode;
  final String label;
  final bool isRtl;

  const LocaleEntity({
    required this.languageCode,
    required this.label,
    required this.isRtl,
  });

  Locale toLocale() => Locale(languageCode);

  static const LocaleEntity english = LocaleEntity(
    languageCode: 'en',
    label: 'English',
    isRtl: false,
  );

  static const LocaleEntity arabic = LocaleEntity(
    languageCode: 'ar',
    label: 'العربية',
    isRtl: true,
  );

  static const List<LocaleEntity> supportedLocales = [english, arabic];

  static LocaleEntity fromCode(String code) => supportedLocales.firstWhere(
    (l) => l.languageCode == code,
    orElse: () => english,
  );

}
