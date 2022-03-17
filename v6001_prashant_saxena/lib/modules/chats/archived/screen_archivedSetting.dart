import 'package:flutter/material.dart';
import 'package:v6001_prashant_saxena/widgets/item_settingOption.dart';
import 'package:v6001_prashant_saxena/widgets/item_toogleButton.dart';

import '../../../constants/color.dart';

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
        title: const Text(
          'Archived Settings',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
        ),
        backgroundColor: appBarColor,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: SettingOption(title: 'Keep Chats archived', leading: null, trailing: MyToogleButton(), subtitle: 'Archived chats will remain archived when you receive a new message',),
      ),
    );
  }
}
