

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../Constants/colors.dart';
import '../../widgets/setting_menu.dart';
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
    firebaseUser = await FirebaseAuth.instance.currentUser;


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
        backgroundColor: ColorConstants.teal_green,
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
                    color: ColorConstants.teal_green,
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
                    color: ColorConstants.teal_green,
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

class ProfileBox extends StatefulWidget {
  final double height;
  final double width;
  final double size;
  final double bottom;
  final double right;
  final icon;
  const ProfileBox(
      {Key? key,
      required this.height,
      required this.width,
      required this.bottom,
      required this.right,
      this.icon,
      required this.size})
      : super(key: key);

  @override
  State<ProfileBox> createState() => _ProfileBoxState();
}

class _ProfileBoxState extends State<ProfileBox> {


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[

        CircleAvatar(
          radius: 60,
          backgroundColor: Colors.grey,
          backgroundImage: NetworkImage(
              'https://www.pngkit.com/png/full/72-729613_icons-logos-emojis-user-icon-png-transparent.png'),
        ),
        Positioned(
          bottom: widget.bottom,
          right: widget.right,
          child: Container(
            height: widget.height,
            width: widget.width,
            child: Icon(
              widget.icon,
              color: Colors.white,
              size: widget.size,
            ),
            decoration: BoxDecoration(
                color: ColorConstants.teal_green, shape: BoxShape.circle),
          ),
        ),
      ],
    );
  }
}
