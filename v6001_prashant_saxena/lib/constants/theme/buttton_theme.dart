import 'package:flutter/material.dart';
import 'package:v6001_prashant_saxena/constants/theme/theme_provider.dart';
import 'package:provider/provider.dart';

import '../color.dart';
import '../localisation/strings.dart';
import '../prefrences.dart';

class ThemeButton extends StatefulWidget {

  ThemeButton({Key? key}) : super(key: key);

  @override
  State<ThemeButton> createState() => _ThemeButtonState();
}

class _ThemeButtonState extends State<ThemeButton> {
  int _themeGroup = -1;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return
      Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
            alignment: Alignment.center,
            child: RadioListTile<int>(
              value: 0,
              groupValue: _themeGroup,
              onChanged: (value) {
                setState(() {
                  _themeGroup = value ?? 0;
                });
                final provider = Provider.of<ThemeProvider>(context, listen: false);
                     provider.toggleTheme(value==0?false:true);              },
              title: Text(
               Strings.of(context)!.Light,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
            alignment: Alignment.center,
            child: RadioListTile<int>(
              value: 1,
              groupValue: _themeGroup,
              onChanged: (value) {
                setState(() {
                  _themeGroup = value ?? 0;
                });
                final provider = Provider.of<ThemeProvider>(context, listen: false);
                provider.toggleTheme(value==0?false:true);
              },
              title: Text(
                Strings.of(context)!.Dark,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      );
    //
    // return Switch.adaptive(
    //   value: themeProvider.isDarkMode,
    //   onChanged: (value) {
    //     final provider = Provider.of<ThemeProvider>(context, listen: false);
    //     provider.toggleTheme(value);
    //   },
    // );
  }
}
