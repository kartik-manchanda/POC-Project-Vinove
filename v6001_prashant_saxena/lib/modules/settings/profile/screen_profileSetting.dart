import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:v6001_prashant_saxena/widgets/item_settingOption.dart';
import 'package:v6001_prashant_saxena/widgets/item_profileBox.dart';

import '../../../constants/color.dart';

var firebaseUser;
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String _userName='';
  @override
  void initState() {
    getCurrentUser();
    _getUserName();
    super.initState();
  }

  getCurrentUser() async {
    firebaseUser = await FirebaseAuth.instance.currentUser?.uid;
  }
  Future<void> _getUserName() async {

    var photo=FirebaseAuth.instance.currentUser?.phoneNumber;
    print("photo$photo");





  }

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
        backgroundColor: Theme.of(context).appBarTheme.color,
      ),
      body: SizedBox(
        height: 400,
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ProfileBox(
                  right: 1.0,
                  height: 45,
                  bottom: 0.0,
                  width: 45,
                  icon: Icons.camera_alt_rounded,
                  size: 25,
                ),
                SettingOption(
                  title: FirebaseAuth.instance.currentUser!.displayName.toString(),
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
                  title: 'About',
                  subtitle: 'Available',
                  leading: Icon(
                    Icons.info_outline,
                    color: Colors.grey,
                  ),
                  onTap: null,
                  trailing: Icon(
                    Icons.edit,
                    color: tabColor,
                  ),
                ),
                SettingOption(
                  title: FirebaseAuth.instance.currentUser!.phoneNumber.toString(),
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
