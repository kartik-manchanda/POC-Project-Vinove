import 'package:flutter/material.dart';
import 'package:sparshtandon_v6000/screens/chats_list/main_chat.dart';
import 'package:sparshtandon_v6000/screens/whatsapp_home.dart';
import 'package:sparshtandon_v6000/util/colors.dart';

import '../../constants/data.dart';
import '../../widgets/settingoption.dart';
import 'account_page.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: ColorFile.teal_green,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context)
                  .pop();
            }),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: ListTile(
              leading: Stack(
                children: <Widget>[
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                        "https://cdn2.vectorstock.com/i/1000x1000/23/81/default-avatar-profile-icon-vector-18942381.jpg"),
                  ),
                ],
              ),
              title: Text(
                "Sparsh Tandon",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("Avaliable"),
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
                    builder: (context) => const AccountPage(),
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
                    builder: (context) =>  AccountPage(),
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
                    builder: (context) => const AccountPage(),
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
                    builder: (context) => const AccountPage(),
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
                    builder: (context) => const AccountPage(),
                  ),
                );
              }),
          SettingOption(
              title: 'Invite a friend',
              leading: Icon(Icons.call),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const AccountPage(),
                  ),
                );
              }),
          // MetaLogo()
        ],
      ),
    );
  }
}
