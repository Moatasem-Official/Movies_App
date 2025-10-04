import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  final SharedPreferences prefs;

  ThemeCubit(this.prefs) : super(_getThemeFromPrefs(prefs));

  static ThemeMode _getThemeFromPrefs(SharedPreferences prefs) {
    final themeString = prefs.getString('theme');
    if (themeString == ThemeMode.dark.toString()) {
      return ThemeMode.dark;
    } else if (themeString == ThemeMode.light.toString()) {
      return ThemeMode.light;
    } else {
      return ThemeMode.dark;
    }
  }

  void changeTheme(ThemeMode theme) {
    prefs.setString('theme', theme.toString());
    emit(theme);
  }
}
