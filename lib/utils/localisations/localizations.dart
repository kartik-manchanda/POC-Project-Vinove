import 'package:flutter/material.dart';
import 'package:kartik_manchanda_v6016/utils/localisations/spanish_text.dart';
import 'package:kartik_manchanda_v6016/utils/localisations/strings.dart';

import 'english_text.dart';


class LocalizationDelegate extends LocalizationsDelegate<Strings> {
  const LocalizationDelegate();
  @override
  // Future<Strings> load(Locale locale) => Future(() => Strings());
  // Future<Strings> load(Locale locale) => Future(() => SpanishText());
  Future<Strings> load(Locale locale) => Future(() => EnglishText());

  @override
  bool shouldReload(LocalizationDelegate old) => false;

  @override
  bool isSupported(Locale locale) => true;


  Future<Strings> _load(Locale locale) async {
    switch (locale.languageCode) {
      case 'En':
        return EnglishText();
      case 'Sp':
        return SpanishText();
      default:
        return EnglishText();
    }
  }


}