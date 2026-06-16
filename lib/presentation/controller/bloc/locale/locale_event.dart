part of 'locale_bloc.dart';

abstract class LocaleEvent {}

class LoadSavedLocale extends LocaleEvent {}

class ChangeLocale extends LocaleEvent {
  final LocaleEntity locale;
  ChangeLocale(this.locale);
}
