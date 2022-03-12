import 'package:flutter/material.dart';
import 'package:sparshtandon_v6000/screens/calls_list/main_call.dart';
import 'package:sparshtandon_v6000/screens/chats_list/main_chat.dart';
import 'package:sparshtandon_v6000/screens/settings/settingsMain.dart';
import 'package:sparshtandon_v6000/screens/status_list/main_status.dart';

import '../localization/english.dart';
import '../util/colors.dart';
import 'camera_screen.dart';

class WhatsAppHome extends StatefulWidget {
  const WhatsAppHome({Key? key}) : super(key: key);

  @override
  _WhatsAppHomeState createState() => _WhatsAppHomeState();
}

class _WhatsAppHomeState extends State<WhatsAppHome> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 4,
        child: Scaffold(

          appBar:  AppBar(
            title: Text(EnglishText.of(context)!.WhatsApp,style: TextStyle(
              fontSize: 18.0,
              //fontWeight: FontWeight.w300,
              color: Colors.white,
            ),),
            backgroundColor: ColorFile.teal_green_dark,
            actions: <Widget>[
              IconButton(
                  icon: Icon(
                    Icons.search,
                  ),
                  onPressed: () {}),



              PopupMenuButton(
                onSelected: (result) {
                  if (result == 6) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SettingsScreen()),
                    );
                  }
                },
                icon: Icon(Icons.more_vert),
                //onSelected: (WhyFarther result) { setState(() { _selection = result; }); },
                itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                  PopupMenuItem(
                    child: Text(EnglishText.of(context)?.NewGroup??"New Group"),
                    value: 1,
                  ),
                  PopupMenuItem(
                    value: 2,
                    child: Text(EnglishText.of(context)?.NewBroadcast??"New BroadCast"),
                  ),
                   PopupMenuItem(
                     value: 3,
                     child: Text(EnglishText.of(context)?.NewBroadcast??"Linked Devices"),
                   ),
                   PopupMenuItem(
                     value: 4,
                     child: Text(EnglishText.of(context)?.NewBroadcast??"Starred Messages"),
                   ),
                  PopupMenuItem(
                    value: 5,
                    child: Text(EnglishText.of(context)?.NewBroadcast??"Payments"),
                  ),
                  PopupMenuItem(
                    value: 6,
                    child: Text(EnglishText.of(context)?.NewBroadcast??"Settings"),
                  ),
                ],
              ),


            ],
            bottom: TabBar(
              indicatorColor: Colors.white,
              tabs: [
                Tab(
                    icon: Icon(Icons.camera_alt)
                ),
                Tab(
                  text: 'CHATS',
                ),
                Tab(
                  text: 'STATUS',
                ),
                Tab(
                  text: 'CALLS',
                )
              ],

            ),
          ),
          body: TabBarView(
            children: [
              CameraScreen(),
              ChatsHome(),
              StatusHome(),
              CallsHome(),
            ],
          ),
        ),
      ),
    );
  }
}
