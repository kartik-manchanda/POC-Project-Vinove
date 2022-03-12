

import 'package:flutter/material.dart';


import 'chatsscreen1.dart';
import '../constants/ColorConstants.dart';
import 'contacts.dart';

class ChatsListPage extends StatefulWidget {
  const ChatsListPage({Key? key}) : super(key: key);

  @override
  State<ChatsListPage> createState() => _ChatsListPageState();
}

class _ChatsListPageState extends State<ChatsListPage> {
  List chats = [
    {
      "title": "Aditya Narayan Swain",
      "subtitle": "hey",
      "image": "images/img.png",
      "trailing": "09:18"
    },
    {
      "title": "sparsh tandon ",
      "subtitle": "hii bhai ",
      "image": "images/img_1.png",
      "trailing": "06:23"
    },
    {
      "title": "kartik",
      "subtitle": "hey buddy ",
      "image": "images/img_7.png",
      "trailing": "20:52"
    },
    {
      "title": "Aditi jamwal",
      "subtitle": "hiii",
      "image": "images/img_3.png",
      "trailing": "13:10"
    },
    {
      "title": "Ankush tyagi ",
      "subtitle": "hello",
      "image": "images/img_4.png",
      "trailing": "11:56"
    },
    {
      "title": " Saini sahab ",
      "subtitle": "hello",
      "image": "images/img_5.png",
      "trailing": "01:00"
    },
    {
      "title": "Ananya",
      "subtitle": "Bhai",
      "image": "images/img_6.png",
      "trailing": "12:00"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(

          child: Icon(Icons.message_rounded),
          backgroundColor: AppColors.teal_dark_green ,
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Contacts()));
          }),
      body: ListView.builder(
        shrinkWrap: true,

        itemCount: chats.length,
        itemBuilder: (context, index) => ListTile(
           onTap: (){
             Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Chatscreen1()));
           },



          title: Text(chats[index]["title"]),
          subtitle: Text(chats[index]["subtitle"]),
          leading: CircleAvatar(
            backgroundImage: AssetImage(chats[index]["image"]),
          ),
          trailing: Text(
            chats[index]["trailing"],
          ),
        ),
      ),
    );
  }
}
