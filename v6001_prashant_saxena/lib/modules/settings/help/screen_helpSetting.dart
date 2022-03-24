import 'package:flutter/material.dart';
import 'package:v6001_prashant_saxena/widgets/item_settingOption.dart';

import '../../../constants/color.dart';
import '../../../constants/localisation/english_text.dart';
import '../../../constants/localisation/strings.dart';

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
        title: Text(
          Strings.of(context)!.Settings, style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
        ),
        backgroundColor: appBarColor,
      ),
      body: Column(
        children: [
          SettingOption(title: Strings.of(context)!.HelpCentre,leading: Icon(Icons.help_outline_outlined, color: Colors.grey,), onTap: (){}),
          SettingOption(title: Strings.of(context)!.ContactUs, subtitle: Strings.of(context)!.QuestionsNeedHelp, leading: Icon(Icons.people, color: Colors.grey,), onTap: (){}),
          SettingOption(title: Strings.of(context)!.TermsAndPrivacyPolicy, leading: Icon(Icons.note, color: Colors.grey,), onTap: (){}),
          SettingOption(title: Strings.of(context)!.AppInfo, leading: Icon(Icons.people, color: Colors.grey,), onTap: (){}),
        ],
      ),
    );
  }
}
