import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:v6001_prashant_saxena/constants/color.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  bool get isDarkMode {
    if (themeMode == ThemeMode.system) {
      final brightness = SchedulerBinding.instance?.window.platformBrightness;
      return brightness == Brightness.dark;
    } else {
      return themeMode == ThemeMode.dark;
    }
  }

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyThemes {
  static final darkTheme = ThemeData(
    primaryColor: messageColor,
    scaffoldBackgroundColor: Color.fromRGBO(26,47,54, 1),
    iconTheme: IconThemeData(color: Colors.grey, opacity: 0.8),
    appBarTheme: AppBarTheme(
      color: Color.fromRGBO(29,53,61,1),
    ),
    colorScheme: ColorScheme.dark(),

  );
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.teal),
    primaryColor: Color.fromRGBO(0, 167, 131, 1),
    appBarTheme: AppBarTheme(
      color: Color.fromRGBO(0, 167, 131, 1),
    ),
    colorScheme: ColorScheme.light(),
  );
}