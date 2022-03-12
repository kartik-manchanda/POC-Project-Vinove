import 'package:adityanarayanswain_v6015/main.dart';
import 'package:adityanarayanswain_v6015/mainscreen/WhatsApp.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'localization/localisationDelegate.dart';
List<CameraDescription> cameras=[];
void main()

  async{


    WidgetsFlutterBinding.ensureInitialized();

    cameras = await availableCameras();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
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
      theme: ThemeData(


        primarySwatch: Colors.blue,
      ),
      home: const WhatsApp(title: '',),
    );
  }
}


