
import 'package:flutter/material.dart';

import 'package:sparshtandon_v6000/scratch.dart';
import 'package:sparshtandon_v6000/screens/whatsapp_home.dart';

import 'localization/localizationDelegate.dart';

//late List<CameraDescription> cameras;
void main()async {
  //WidgetsFlutterBinding.ensureInitialized();

 // cameras = await availableCameras();
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
      //   Locale('Sp',''),
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
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: true,

     // onGenerateTitle: (context) {
        //var t = AppLocalizations.of(context);
        //return t.apptittle;
      //},

      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Scratch(),
    );
  }
}

