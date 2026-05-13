import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit()
      : super(
          const LocaleState(
            Locale('pt'),
          ),
        ) {
    loadLocale();
  }

  Future<void> loadLocale() async {
    final prefs =
        await SharedPreferences.getInstance();

    final languageCode =
        prefs.getString('languageCode');

    if (languageCode != null) {
      emit(
        LocaleState(
          Locale(languageCode),
        ),
      );
    }
  }

  Future<void> changeLocale(
    String languageCode,
  ) async {
    final prefs =
        await SharedPreferences.getInstance();

    await prefs.setString(
      'languageCode',
      languageCode,
    );

    emit(
      LocaleState(
        Locale(languageCode),
      ),
    );
  }

  Future<void> toggle() async {
    if (state.locale.languageCode == 'pt') {
      await changeLocale('en');
    } else {
      await changeLocale('pt');
    }
  }
}