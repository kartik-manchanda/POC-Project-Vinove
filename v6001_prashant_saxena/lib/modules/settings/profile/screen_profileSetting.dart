import 'package:flutter/material.dart';
import 'package:v6001_prashant_saxena/widgets/item_settingOption.dart';
import 'package:v6001_prashant_saxena/widgets/item_profileBox.dart';

import '../../../constants/color.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

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
          'Profile',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
        ),
        backgroundColor: appBarColor,
      ),
      body: SizedBox(
        height: 400,
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                ProfileBox(
                  right: 1.0,
                  height: 45,
                  bottom: 0.0,
                  width: 45,
                  icon: Icons.camera_alt_rounded,
                  size: 25,
                ),
                SettingOption(
                  title: 'Prashant Saxena',
                  subtitle:
                      'This is not your username or pin. This name will be visible to your WhatsApp contacts.',
                  leading: Icon(
                    Icons.person,
                    color: Colors.grey,
                  ),
                  onTap: null,
                  trailing: Icon(
                    Icons.edit,
                    color: tabColor,
                  ),
                ),
                SettingOption(
                  title: 'New User',
                  subtitle: 'About',
                  leading: Icon(
                    Icons.info_outline,
                    color: Colors.grey,
                  ),
                  onTap:null,
                  trailing: Icon(
                    Icons.edit,
                    color: tabColor,
                  ),
                ),
                SettingOption(
                  title: '+91 1234567890',
                  subtitle: 'Phone',
                  leading: Icon(
                    Icons.phone,
                    color: Colors.grey,
                  ),
                  onTap: null,
                  // onTap: () {
                  //   Navigator.of(context).push(
                  //     MaterialPageRoute(
                  //       builder: (context) => const (),
                  //     ),
                  //   );
                  // },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
