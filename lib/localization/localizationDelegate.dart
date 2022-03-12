import 'package:flutter/material.dart';
import 'package:sparshtandon_v6000/localization/english.dart';
import 'package:sparshtandon_v6000/localization/spanish.dart';
import 'package:sparshtandon_v6000/localization/strings.dart';


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
      case 'Fr':
        return SpanishText();
      default:
        return EnglishText();
    }
  }


}