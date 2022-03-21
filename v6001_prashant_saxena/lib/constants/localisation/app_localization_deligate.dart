import 'package:flutter/material.dart';
import 'package:v6001_prashant_saxena/constants/localisation/french_text.dart';
import 'package:v6001_prashant_saxena/constants/localisation/english_text.dart';
import 'package:v6001_prashant_saxena/constants/localisation/strings.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<Strings> {
  const AppLocalizationsDelegate();
  @override
  // Future<Strings> load(Locale locale) => Future(() => Strings());
  Future<Strings> load(Locale locale) => Future(() => EnglishText());
  // Future<Strings> load(Locale locale) => Future(() => FrenchText());

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;

  @override
  bool isSupported(Locale locale) => true;


  Future<Strings> _load(Locale locale) async {
    switch (locale.languageCode) {
      case 'En':
        return EnglishText();
      case 'Fr':
        return FrenchText();
      default:
        return EnglishText();
    }
  }


}

/*

class AppLocalizationsDelegate extends LocalizationsDelegate<Strings> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'fr'].contains(locale.languageCode);

  @override
  Future<Strings> load(Locale locale) => _load(locale);

  Future<Strings> _load(Locale locale) async {
    switch (locale.languageCode) {
      case 'en':
        return EnglishText();
      case 'fr':
        return FrenchText();
      default:
        return EnglishText();
    }
  }

  @override
  bool shouldReload(LocalizationsDelegate<Strings> old) => false;
}

*/

