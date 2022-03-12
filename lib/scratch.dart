import 'package:flutter/material.dart';
import 'package:sparshtandon_v6000/screens/chats_list/main_chat.dart';
import 'package:sparshtandon_v6000/screens/chats_list/messagepage.dart';
import 'package:sparshtandon_v6000/screens/settings/account_page.dart';
import 'package:sparshtandon_v6000/screens/settings/settingsMain.dart';
import 'package:sparshtandon_v6000/util/colors.dart';
import 'package:sparshtandon_v6000/widgets/myappbar.dart';
import 'package:sparshtandon_v6000/widgets/settingoption.dart';
import 'package:sparshtandon_v6000/widgets/submenu.dart';

import 'constants/data.dart';

class Scratch extends StatefulWidget {
  const Scratch({Key? key}) : super(key: key);

  @override
  _ScratchState createState() => _ScratchState();
}

class _ScratchState extends State<Scratch> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(
          'Account',
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
          ListView.builder(
            shrinkWrap: true,


              itemCount: 1,
              itemBuilder: (context, index) => ListTile(
                title: Text('Conversation Tones',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),),
                subtitle:Text('Play Sounds for Incoming And Outgoing Messages'),
              )),
        ],
      ),
    );
  }
}
