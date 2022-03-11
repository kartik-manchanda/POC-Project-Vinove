import 'package:flutter/material.dart';
import 'package:v6001_prashant_saxena/modules/settings/screen_settings.dart';
import 'package:v6001_prashant_saxena/screens/mobile_home.dart';
import 'package:v6001_prashant_saxena/screens/web_home.dart';

import 'constants/color.dart';
import 'constants/localisation/app_localization_deligate.dart';
import 'constants/responsiveness.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp Clone',
      // locale: _locale,
      // supportedLocales: [
      //   Locale('En',''),
      //   Locale('Fr',''),
      // ],
      localizationsDelegates: [
        DefaultMaterialLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
        AppLocalizationDelegate()
      ],
      // localeResolutionCallback: (locale, supportedLocales) {
      //   for (var supportedLocale in supportedLocales) {
      //     if (supportedLocale.languageCode == locale?.languageCode) {
      //       _locale = supportedLocale;
      //       return supportedLocale;
      //     }
      //   }
      //   return supportedLocales.first;
      // },
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      // home: const Splash(),
      home: const Responsive(mobile_homeLayout: MobileHome(), web_homeLayout: WebHome(),),
      //   home: Settings(),
    );


  }
}
