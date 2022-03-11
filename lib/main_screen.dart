import 'package:flutter/material.dart';
import 'package:kartik_manchanda_v6016/setting_screen.dart';
import 'package:kartik_manchanda_v6016/utils/localisations/english_text.dart';


import 'Screens/Chats/chat_screen.dart';
import 'Constants/colors.dart';
import 'Screens/Chats/chats_list_page.dart';
import 'Screens/Status/status_page.dart';
import 'Screens/calls/calls_list_page.dart';
import 'Screens/camera/camera_screen.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double tabWidth = width / 5;
    return DefaultTabController(
      initialIndex: 1,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorConstants.teal_green,
          actions: [
            Icon(Icons.search),
            _selectedIndex == 1
                ? PopupMenuButton(
                    icon: const Icon(Icons.more_vert),
                    onSelected: (result) {
                      if (result == 1) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SettingsScreen()),
                        );
                      }
                    },
                    itemBuilder: (context) => [
                          PopupMenuItem(

                            child: Text(EnglishText.of(context)!.NewGroup),
                            value: 1,
                          ),
                          PopupMenuItem(
                            child: Text(EnglishText.of(context)!.NewBroadcast),
                            value: 1,
                          ),
                          PopupMenuItem(
                            child: Text(EnglishText.of(context)!.LinkedDevice),
                            value: 1,
                          ),
                          PopupMenuItem(
                            child: Text(EnglishText.of(context)!.StarredMessages),
                            value: 1,
                          ),
                          PopupMenuItem(
                            child: Text(EnglishText.of(context)!.Payments),
                            value: 1,
                          ),
                          PopupMenuItem(
                            child: Text(EnglishText.of(context)!.Settings),
                            value: 1,
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
          title: Text(EnglishText.of(context)!.WhatsApp),
          bottom: TabBar(
            onTap: (int selected) {
              setState(() {
                _selectedIndex = selected;
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
                ),
              ),
              Container(
                  width: tabWidth,
                  height: 50,
                  alignment: Alignment.center,
                  child: Text("CHATS")),
              Container(
                  width: tabWidth,
                  height: 50,
                  alignment: Alignment.center,
                  child: Text("STATUS")),
              Container(
                  width: tabWidth,
                  height: 50,
                  alignment: Alignment.center,
                  child: Text("CALL"))
            ],
          ),
        ),
        body: TabBarView(
          children: [
            CameraScreen(),
            // ChatsListPage(),
            ChatsListPage(),
            StatusPage(),
            CallsListPage()
          ],
        ),
      ),
    );
  }
}
