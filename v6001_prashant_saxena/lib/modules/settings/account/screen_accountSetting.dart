import 'package:flutter/material.dart';
import 'package:v6001_prashant_saxena/modules/settings/screen_changeNumber.dart';
import 'package:v6001_prashant_saxena/modules/settings/account/screen_privacySetting.dart';
import 'package:v6001_prashant_saxena/widgets/item_settingOption.dart';

import '../../../constants/color.dart';

class AccountSetting extends StatelessWidget {
  const AccountSetting({Key? key}) : super(key: key);

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
          'Account',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
        ),
        backgroundColor: appBarColor,
      ),
      body: Column(
        children: [
          SettingOption(
              title: 'Privacy',
              leading: Icon(
                Icons.lock,
                color: Colors.grey,
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const PrivacySetting(),
                  ),
                );
              }),
          SettingOption(
              title: 'Security',
              leading: Icon(
                Icons.shield,
                color: Colors.grey,
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const AccountSetting(),
                  ),
                );
              }),
          SettingOption(
              title: 'Two-step verification',
              leading: Icon(
                Icons.more_horiz_rounded,
                color: Colors.grey,
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const AccountSetting(),
                  ),
                );
              }),
          SettingOption(
              title: 'Change Number',
              leading: Icon(
                Icons.phone_android_sharp,
                color: Colors.grey,
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ChangeNum(),
                  ),
                );
              }),
          SettingOption(
              title: 'Request account info',
              leading: Icon(
                Icons.note_outlined,
                color: Colors.grey,
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const AccountSetting(),
                  ),
                );
              }),
          SettingOption(
              title: 'Delete my account',
              leading: Icon(
                Icons.delete,
                color: Colors.grey,
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const AccountSetting(),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
