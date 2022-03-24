import 'package:flutter/material.dart';
import 'package:v6001_prashant_saxena/modules/settings/screen_changeNumber.dart';
import 'package:v6001_prashant_saxena/modules/settings/account/screen_privacySetting.dart';
import 'package:v6001_prashant_saxena/widgets/item_settingOption.dart';
import '../../../constants/color.dart';
import '../../../constants/localisation/strings.dart';

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
        title:  Text(
          Strings.of(context)!.Account,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
        ),
        backgroundColor: appBarColor,
      ),
      body: Column(
        children: [
          SettingOption(
              title: Strings.of(context)!.Privacy,
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
              title: Strings.of(context)!.Privacy,
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
              title: Strings.of(context)!.TwoStepVerification,
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
              title: Strings.of(context)!.ChangeNumber,
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
              title: Strings.of(context)!.RequestAcoountInfo,
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
              title: Strings.of(context)!.DeleteMyAccount,
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
