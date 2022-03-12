import 'package:adityanarayanswain_v6015/Settings/profile.dart';
import 'package:flutter/material.dart';

import '../data.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  List account = [
    {
      "title": "Privacy",
      "subtitle": "hey",
      "image": "images/img.png",
      "trailing": "09:18"
    },
    {
      "title": "Security",
      "subtitle": "hii bhai ",
      "image": "images/img_1.png",
      "trailing": "06:23"
    },
    {
      "title": "Two-Step verification",
      "subtitle": "hey buddy ",
      "image": "images/img_7.png",
      "trailing": "20:52"
    },
    {
      "title": "Change Number",
      "subtitle": "hiii",
      "image": "images/img_3.png",
      "trailing": "13:10"
    },
    {
      "title": "Request Account Information",
      "subtitle": "hello",
      "image": "images/img_4.png",
      "trailing": "11:56"
    },
    {
      "title": "Delete My Account ",
      "subtitle": "hello",
      "image": "images/img_5.png",
      "trailing": "01:00"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Account"),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: chats.length,
        itemBuilder: (context, index) => ListTile(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Profile ()));
          },
          title: Text(account[index]["title"]),
          subtitle: Text(account[index]["subtitle"]),
          leading: CircleAvatar(
            backgroundImage: AssetImage(account[index]["image"]),
          ),
        ),
      ),
    );
  }
}
