import 'package:flutter/material.dart';
import 'package:kartik_manchanda_v6016/Constants/colors.dart';
import 'package:kartik_manchanda_v6016/Screens/Chats/chat_screen.dart';
import 'package:kartik_manchanda_v6016/widgets/setting_menu.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

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
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: const Text(
          'Settings',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
        ),
        backgroundColor: ColorConstants.teal_green,
      ),
      body: Column(
        children: [
          InkWell(
            onTap: () {
              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder: (context) => const Profile(),
              //   ),
              // );
            },
            child: ListTile(
              title: Text(
                'Kartik',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/profile_pic.png'),
                radius: 25,
              ),
              subtitle: Padding(
                padding: EdgeInsets.only(top: 6.0),
                child: Text(
                  'Busy',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.crop_square,
                  color: Colors.teal,
                ),
              ),
            ),
          ),
          Divider(
            endIndent: 5,
            indent: 5,
          ),
          SettingOption(
              title: 'Account',
              subtitle: 'Privacy, security, change number',
              leading: Icon(Icons.vpn_key_rounded),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ChatScreen(name: ''),
                  ),
                );
              }),
          SettingOption(
              title: 'Chats',
              subtitle: 'Theme, wallpaper, chat history',
              leading: Icon(Icons.chat_sharp),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ChatScreen(name: ''),
                  ),
                );
              }),
          SettingOption(
              title: 'Notifications',
              subtitle: 'Message, grooup & call tone',
              leading: Icon(Icons.notifications),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ChatScreen(name: ''),
                  ),
                );
              }),
          SettingOption(
              title: 'Storage and Data',
              subtitle: 'Network usage, auto-download',
              leading: Icon(Icons.storage),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ChatScreen(name: ''),
                  ),
                );
              }),
          SettingOption(
              title: 'Help',
              subtitle: 'Help centre, contact us, privacy policy',
              leading: Icon(Icons.help_outline_outlined),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ChatScreen(name: ''),
                  ),
                );
              }),
          SettingOption(
              title: 'Invite a friend',
              leading: Icon(Icons.call),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ChatScreen(name: ''),
                  ),
                );
              }),
          // MetaLogo()
        ],
      ),
    );
  }
}
