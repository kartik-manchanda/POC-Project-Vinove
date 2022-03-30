import 'package:camera/camera.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:kartik_manchanda_v6016/Screens/welcome%20screen/welcome_screen.dart';
import 'package:kartik_manchanda_v6016/main_screen.dart';

import 'package:kartik_manchanda_v6016/utils/localisations/app_translation_delegate.dart';
import 'package:kartik_manchanda_v6016/utils/localisations/application.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Constants/colors.dart';

List<CameraDescription> cameras = [];
int ?initScreen = 0;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  //
  initScreen = prefs.getInt("initScreen");

  await prefs.setInt("initScreen", 1);

  cameras = await availableCameras();
  print("cameras$cameras");

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late AppTranslationsDelegate _newLocaleDelegate;

  @override
  void initState() {
    _newLocaleDelegate = AppTranslationsDelegate();
    application.onLocaleChanged = onLocaleChange;
    super.initState();
  }

  void onLocaleChange(Locale locale) {
    setState(() {
      _newLocaleDelegate = AppTranslationsDelegate(newLocale: locale);
    });
  }

  // if(FirebaseAuth.instance.currentUser() != null){
  // // wrong call in wrong place!
  // Navigator.of(context).pushReplacement(MaterialPageRoute(
  // builder: (context) => HomeScreen()
  // ));
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        _newLocaleDelegate,
        AppTranslationsDelegate(),
        //provides localised strings
        GlobalMaterialLocalizations.delegate,
        //provides RTL support
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: application.supportedLocales(),
      title: 'watsapp clone',
      theme: ThemeData(primaryColor: ColorConstants.teal_green),
      home: initScreen == 0 || initScreen == null
          ? WelcomeScreen()
          : MainScreen(),
      // home: WelcomeScreen(),
    );
  }
}
