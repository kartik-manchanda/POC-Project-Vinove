import 'package:flutter/material.dart';
import 'package:v6001_prashant_saxena/modules/chats/archived/screen_archived.dart';
import 'package:v6001_prashant_saxena/modules/chats/screen_chatContacts.dart';
import 'package:v6001_prashant_saxena/widgets/item_settingOption.dart';

import '../../constants/color.dart';
import '../../widgets/item_ChatList.dart';

class Chats extends StatelessWidget {
  const Chats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ChatList(),
          SettingOption(title: 'Archived', leading: Icon(Icons.archive_outlined, color: Colors.grey,), trailing: Text('1', style: TextStyle(color: Colors.grey),),
            onTap: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ArchivedScreen(),),);},)
        ],
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: tabColor,
          child: const Icon(Icons.message, color: Colors.white,),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ChatContacts(),),);
          }
      ),

    );
  }
}
