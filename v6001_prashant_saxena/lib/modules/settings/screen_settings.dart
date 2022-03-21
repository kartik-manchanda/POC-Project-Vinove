import 'package:flutter/material.dart';
import 'package:v6001_prashant_saxena/modules/settings/account/screen_accountSetting.dart';
import 'package:v6001_prashant_saxena/modules/settings/chats/screen_chatsSetting.dart';
import 'package:v6001_prashant_saxena/modules/settings/help/screen_helpSetting.dart';
import 'package:v6001_prashant_saxena/modules/settings/notification/screen_notificationSetting.dart';
import 'package:v6001_prashant_saxena/modules/settings/profile/screen_QRCode.dart';
import 'package:v6001_prashant_saxena/modules/settings/profile/screen_profileSetting.dart';
import 'package:v6001_prashant_saxena/modules/settings/screen_invite.dart';
import 'package:v6001_prashant_saxena/modules/settings/storage/screen_StorageSetting.dart';
import 'package:v6001_prashant_saxena/widgets/item_settingOption.dart';
import 'package:v6001_prashant_saxena/widgets/item_metaLogo.dart';

import '../../constants/color.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
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
          'Settings', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
        ),
        backgroundColor: appBarColor,
      ),
      body:
      Column(
        children: [
          InkWell(onTap: (){
            Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const Profile(),
                    ),
                  );
          },
            child: ListTile(
              title: Text('Prashant Saxena',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500
                ),
              ),
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/profile_pic.png'),
                radius: 25,
              ),
              subtitle: Padding(
                padding: EdgeInsets.only(top: 6.0),
                child: Text('New User.',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              trailing: IconButton(
                onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => const QRCodeScreen(),),);},
                icon: Icon(
                Icons.qr_code,
                color: tabColor,
              ),),
            ),
          ),
          Divider(endIndent: 5,indent: 5,),
          SettingOption(
              title: 'Account',
              subtitle: 'Privacy, security, change number',
              leading: Icon(Icons.vpn_key_rounded),
              onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AccountSetting(),),);}
          ),
          SettingOption(
              title: 'Chats',
              subtitle: 'Theme, wallpaper, chat history',
              leading: Icon(Icons.chat_sharp),
              onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ChatsSetting(),),);}
          ),
          SettingOption(
              title: 'Notifications',
              subtitle: 'Message, grooup & call tone',
              leading: Icon(Icons.notifications),
              onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => const NotificationSetting(),),);}
          ),
          SettingOption(
              title: 'Storage and Data',
              subtitle: 'Network usage, auto-download',
              leading: Icon(Icons.storage),
              onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => const StorageSetting(),),);}
          ),
          SettingOption(
              title: 'Help',
              subtitle: 'Help centre, contact us, privacy policy',
              leading: Icon(Icons.help_outline_outlined),
              onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HelpSettings(),),);}
          ),
          SettingOption(
              title: 'Invite a friend',
              leading: Icon(Icons.call),
              onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => const  InvitePage(),),);}
          ),
          MetaLogo()
        ],
      ),
    );
  }
}
