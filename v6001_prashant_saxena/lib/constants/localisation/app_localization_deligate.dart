import 'package:flutter/material.dart';
import 'package:v6001_prashant_saxena/constants/localisation/french_text.dart';
import 'package:v6001_prashant_saxena/constants/localisation/english_text.dart';
import 'package:v6001_prashant_saxena/constants/localisation/strings.dart';


class AppLocalizationDelegate extends LocalizationsDelegate<Strings> {
  const AppLocalizationDelegate();
  @override
  // Future<Strings> load(Locale locale) => Future(() => Strings());
  Future<Strings> load(Locale locale) => Future(() => EnglishText());
  // Future<Strings> load(Locale locale) => Future(() => FrenchText());

  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

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