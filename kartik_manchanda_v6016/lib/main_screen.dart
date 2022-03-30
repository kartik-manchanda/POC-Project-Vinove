import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:kartik_manchanda_v6016/Screens/people_list.dart';
import 'package:kartik_manchanda_v6016/Screens/settings/setting_screen.dart';
import 'package:kartik_manchanda_v6016/utils/localisations/app-translations.dart';

import 'package:permission_handler/permission_handler.dart';

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
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double tabWidth = width / 5;
    return DefaultTabController(
      initialIndex: 1,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: ColorConstants.teal_green,
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
                            child: Text(AppTranslations.of(context)!.text("menu_1_1")),
                            value: 1,
                          ),
                          PopupMenuItem(
                            child:Text(AppTranslations.of(context)!.text("menu_1_2")),
                            value: 2,
                          ),
                          PopupMenuItem(
                            child: Text(AppTranslations.of(context)!.text("menu_1_3")),
                            value: 3,
                          ),
                          PopupMenuItem(
                            child:
                            Text(AppTranslations.of(context)!.text("menu_1_4")),
                            value: 4,
                          ),
                          PopupMenuItem(
                            child:Text(AppTranslations.of(context)!.text("menu_1_5")),
                            value: 5,
                          ),
                          PopupMenuItem(
                            child: Text(AppTranslations.of(context)!.text("menu_1_6")),
                            value: 6,
                          ),
                        ])
                : _selectedIndex == 2
                    ? PopupMenuButton(
                        icon: Icon(Icons.more_vert),
                        itemBuilder: (context) => [
                              PopupMenuItem(
                                child: Text(AppTranslations.of(context)!.text("menu_2_1")),
                                value: 1,
                              ),
                              PopupMenuItem(
                                child:Text(AppTranslations.of(context)!.text("menu_2_2")),
                                value: 2,
                              )
                            ])
                    : PopupMenuButton(
                        icon: Icon(Icons.more_vert),
                        itemBuilder: (context) => [
                              PopupMenuItem(
                                child: Text(AppTranslations.of(context)!.text("menu_3_1")),
                                value: 1,
                              ),
                              PopupMenuItem(
                                child: Text(AppTranslations.of(context)!.text("menu_3_2")),
                                value: 2,
                              ),
                            ]),
          ],
          title: Text(AppTranslations.of(context)!.text("appName")),
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
                  child: Text(AppTranslations.of(context)!.text("tab_chats"))),
              Container(
                  width: tabWidth,
                  height: 50,
                  alignment: Alignment.center,
                  child: Text(AppTranslations.of(context)!.text("tab_status"))),
              Container(
                  width: tabWidth,
                  height: 50,
                  alignment: Alignment.center,
                  child: Text(AppTranslations.of(context)!.text("tab_call"))),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            CameraScreen(),
            // ChatsListPage(),
            People(),
            StatusPage(),
            CallsListPage()
          ],
        ),
      ),
    );
  }
}
