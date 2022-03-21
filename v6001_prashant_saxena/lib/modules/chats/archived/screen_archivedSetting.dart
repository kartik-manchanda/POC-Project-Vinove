import 'package:flutter/material.dart';
import 'package:v6001_prashant_saxena/widgets/item_settingOption.dart';
import 'package:v6001_prashant_saxena/widgets/item_toogleButton.dart';

import '../../../constants/color.dart';
import '../../../constants/localisation/english_text.dart';

class ArchivedSetting extends StatelessWidget {
  const ArchivedSetting({Key? key}) : super(key: key);

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
          EnglishText.of(context)!.ArchivedSetting,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
        ),
        backgroundColor: appBarColor,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: SettingOption(title: EnglishText.of(context)!.KeepChatsArchived, leading: null, trailing: MyToogleButton(), subtitle: EnglishText.of(context)!.ArchivedScreenMsg,),
      ),
    );
  }
}
