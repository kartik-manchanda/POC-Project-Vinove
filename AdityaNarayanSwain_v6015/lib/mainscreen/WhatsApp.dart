import 'package:adityanarayanswain_v6015/calls_list/Callmainpage.dart';
import 'package:adityanarayanswain_v6015/Camera_list/CameraPage.dart';
import 'package:adityanarayanswain_v6015/chats_list/Chatsmainscreen.dart';
import 'package:adityanarayanswain_v6015/seetingd/srttingscreen.dart';
import 'package:adityanarayanswain_v6015/status_list/Statusmain.dart';

import 'package:flutter/material.dart';

import '../constants/ColorConstants.dart';
import '../constants/Stringcontsnts.dart';
import '../localization/english.dart';

class WhatsApp extends StatefulWidget {
  const WhatsApp({Key? key, required String title}) : super(key: key);

  @override
  State<WhatsApp> createState() => _WhatsAppState();
}

class _WhatsAppState extends State<WhatsApp> {
  late TabController _tabController;
  int _selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double tabWidth = width / 5;
    return DefaultTabController(
      initialIndex: 1,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.teal_dark_green,
          actions: [
            Icon(Icons.search),
            _selectedIndex == 1
                ? PopupMenuButton(
                icon: const Icon(Icons.more_vert),
                onSelected: (result) {
                  if (result == 6) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SettingsScreen()),
                    );
                  }
                },
                itemBuilder: (context) => [
                  PopupMenuItem(

                    child: Text(EnglishText.of(context)!.NewGroup ),
                    value: 1,
                  ),
                  PopupMenuItem(
                    child: Text(EnglishText.of(context)!.NewBroadcast),
                    value: 2,
                  ),
                  PopupMenuItem(
                    child: Text(EnglishText.of(context)!.LinkedDevice),
                    value: 3,
                  ),
                  PopupMenuItem(
                    child: Text(EnglishText.of(context)!.StarredMessages),
                    value: 4,
                  ),
                  PopupMenuItem(
                    child: Text(EnglishText.of(context)!.Payments),
                    value: 5,
                  ),
                  PopupMenuItem(
                    child: Text(EnglishText.of(context)!.Settings),
                    value: 6,
                  ),
                ])
                : _selectedIndex == 2
                ? PopupMenuButton(
                icon: Icon(Icons.more_vert),
                itemBuilder: (context) => [
                  PopupMenuItem(
                    child: Text(EnglishText.of(context)!.StatusPrivacy),
                    value: 1,
                  ),
                  PopupMenuItem(
                    child: Text(EnglishText.of(context)!.Settings),
                    value: 2,
                  )
                ])
                : PopupMenuButton(
                icon: Icon(Icons.more_vert),
                itemBuilder: (context) => [
                  PopupMenuItem(
                    child: Text(EnglishText.of(context)!.ClearCallLogs),
                    value: 1,
                  ),
                  PopupMenuItem(
                    child: Text(EnglishText.of(context)!.Settings),
                    value: 1,
                  ),
                ]),
          ],
          title: Text("WhatsApp"),
          bottom: TabBar(
            onTap: (int selected){
              setState(() {
                _selectedIndex=selected;

              });
            },
            // controller: _tabController,
            indicatorColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: <Widget>[
              Container(
                width: 30,
                alignment: Alignment.center,
                child: Icon(
                  Icons.camera_alt,
                  size: 20.0,
                ),
              ),
              Container(
                  width: tabWidth,
                  height: 50,
                  alignment: Alignment.center,
                  child: Text(EnglishText.of(context)!.Chats)),
              Container(
                  width: tabWidth,
                  height: 50,
                  alignment: Alignment.center,
                  child: Text(EnglishText.of(context)!.Status)),
              Container(
                  width: tabWidth,
                  height: 50,
                  alignment: Alignment.center,
                  child: Text(EnglishText.of(context)!.Calls))
            ],
          ),
        ),
        body: TabBarView(
          children: [
            CameraScreen(),
            ChatsListPage(),
            StatusPage(),
            CallsListPage()
          ],
        ),
      ),
    );
  }
}