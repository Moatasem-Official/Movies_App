import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleCubit extends Cubit<Locale> {
  final SharedPreferences prefs;

  LocaleCubit(this.prefs) : super(Locale(prefs.getString('locale') ?? 'en'));

  void changeLocale(Locale locale) {
    prefs.setString('locale', locale.languageCode);
    emit(locale);
  }
}
