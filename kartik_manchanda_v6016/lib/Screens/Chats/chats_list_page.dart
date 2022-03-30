import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kartik_manchanda_v6016/Screens/people_list.dart';

import '../Chats/chat_screen.dart';
import '../../Constants/colors.dart';
import 'contacts.dart';
import '../register/sign_in.dart';

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
          child: const Icon(Icons.message),
          backgroundColor: ColorConstants.teal_green,
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => People()));
          },
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection("chats").snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text("Something went wrong"),
                );
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: Text("Loading"),
                );
              }

              if (snapshot.hasData) {
                print("dataagya");
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      print("listagya");
                      DocumentSnapshot list = snapshot.data!.docs[index];
                      print("listagyafinal$list");
                      return ListTile(
                        onTap: () {},
                        title: Text(
                          list['name'].toString(),
                          style: TextStyle(
                              color: ColorConstants.black, fontSize: 14),
                        ),
                      );
                    });
              }
              return Container();
            }));
  }
}
