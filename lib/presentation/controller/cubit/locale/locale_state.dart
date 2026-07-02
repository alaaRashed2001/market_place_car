import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_place_car/core/global/localization/helper/locale_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocaleState {}
class LocaleInitial extends LocaleState {}
class LocaleLoaded extends LocaleState {
  final LocaleEntity locale;
  LocaleLoaded(this.locale);
}

class LocaleCubit extends Cubit<LocaleState> {
  final SharedPreferences sharedPreferences;

  LocaleCubit({required this.sharedPreferences}) : super(LocaleInitial());

  void loadSavedLocale() {
    final code = sharedPreferences.getString(LocaleEntity.prefKey);
    final locale = code != null ? LocaleEntity.fromCode(code) : LocaleEntity.english;
    emit(LocaleLoaded(locale));
  }

  Future<void> changeLocale(LocaleEntity locale) async {
    await sharedPreferences.setString(LocaleEntity.prefKey, locale.languageCode);
    emit(LocaleLoaded(locale));
  }
}