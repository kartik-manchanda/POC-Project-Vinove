import 'package:flutter/material.dart';

import '../Chats/chat_screen.dart';
import '../../Constants/colors.dart';

class ChatsListPage extends StatefulWidget {
  const ChatsListPage({Key? key}) : super(key: key);

  @override
  _ChatsListPageState createState() => _ChatsListPageState();
}

class _ChatsListPageState extends State<ChatsListPage> {
  List<Map<String, dynamic>> chatsList = [
    {
      "name": "gagu",
      "last_message": "hi",
      "photo": Icons.person,
      "time": "16:46"
    },
    {
      "name": "aditya",
      "last_message": "bhai",
      "photo": Icons.person,
      "time": "19:48"
    },
    {
      "name": "sparsh",
      "last_message": "sun yr",
      "photo": Icons.person,
      "time": "16:44"
    },
    {
      "name": "ananya",
      "last_message": "pagal hai kya",
      "photo": Icons.person,
      "time": "18:46"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.message_rounded),
          backgroundColor: ColorConstants.teal_green_light,
          onPressed: () {}),
      body: ListView.builder(
          itemCount: chatsList.length,
          itemBuilder: (context, index) => ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => ChatScreen(
                            name: chatsList[index]['name'].toString(),
                          )));
                },
                title: Text(
                  chatsList[index]['name'].toString(),
                  style: TextStyle(color: ColorConstants.black),
                ),
                leading: CircleAvatar(
                  child: Icon(chatsList[index]['photo']),
                ),
                subtitle: Text(chatsList[index]['last_message'].toString()),
                trailing: Text(chatsList[index]['time'].toString(),
                    style: TextStyle(color: Colors.grey[600], fontSize: 12)),
              )),
    );
  }
}
