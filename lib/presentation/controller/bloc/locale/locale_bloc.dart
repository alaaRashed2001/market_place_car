import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_place_car/domain/entities/locale/locale_entity.dart';
import 'package:market_place_car/domain/usecases/locale/change_locale_usecase.dart';
import 'package:market_place_car/domain/usecases/locale/get_locale_usecase.dart';
part 'locale_event.dart';
part 'locale_state.dart';

class LocaleBloc extends Bloc<LocaleEvent, LocaleState> {
  final GetLocaleUseCase _getLocale;
  final ChangeLocaleUseCase _changeLocale;

  LocaleBloc({
    required GetLocaleUseCase getLocale,
    required ChangeLocaleUseCase changeLocale,
  })  : _getLocale = getLocale,
        _changeLocale = changeLocale,
        super(LocaleInitial()) {
    on<LoadSavedLocale>(_onLoad);
    on<ChangeLocale>(_onChange);
  }

  Future<void> _onLoad(LoadSavedLocale event, Emitter<LocaleState> emit) async {
    final locale = await _getLocale();
    emit(LocaleLoaded(locale));
  }

  Future<void> _onChange(ChangeLocale event, Emitter<LocaleState> emit) async {
    await _changeLocale(event.locale);
    emit(LocaleLoaded(event.locale));
  }
}
