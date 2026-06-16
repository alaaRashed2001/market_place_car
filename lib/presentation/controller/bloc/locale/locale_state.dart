part of 'locale_bloc.dart';

abstract class LocaleState {}

class LocaleInitial extends LocaleState {}

class LocaleLoaded extends LocaleState {
  final LocaleEntity locale;
  LocaleLoaded(this.locale);
}
