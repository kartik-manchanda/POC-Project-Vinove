import 'package:flutter/material.dart';
import 'package:v6001_prashant_saxena/widgets/item_settingOption.dart';

import '../../../constants/color.dart';

class HelpSettings extends StatelessWidget {
  const HelpSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: const Text(
          'Settings', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
        ),
        backgroundColor: appBarColor,
      ),
      body: Column(
        children: [
          SettingOption(title: 'Help Centre',leading: Icon(Icons.help_outline_outlined, color: Colors.grey,), onTap: (){}),
          SettingOption(title: 'Contact us', subtitle: 'Questions? Need Help?', leading: Icon(Icons.people, color: Colors.grey,), onTap: (){}),
          SettingOption(title: 'Terms and Privacy Policy', leading: Icon(Icons.note, color: Colors.grey,), onTap: (){}),
          SettingOption(title: 'App info', leading: Icon(Icons.people, color: Colors.grey,), onTap: (){}),
        ],
      ),
    );
  }
}
