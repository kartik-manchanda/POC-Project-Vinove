import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:kartik_manchanda_v6016/main_screen.dart';
import 'package:kartik_manchanda_v6016/utils/localisations/localizations.dart';

import 'Constants/colors.dart';

List<CameraDescription> cameras = [];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  cameras = await availableCameras();
  print("cameras$cameras");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // locale: _locale,
      // supportedLocales: [
      //   Locale('En',''),
      //   Locale('Fr',''),
      // ],
      localizationsDelegates: [
        DefaultMaterialLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
        LocalizationDelegate()
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
      title: 'watsapp clone',
      theme: ThemeData(primaryColor: ColorConstants.teal_green),
      home: const MainScreen(),
    );
  }
}
