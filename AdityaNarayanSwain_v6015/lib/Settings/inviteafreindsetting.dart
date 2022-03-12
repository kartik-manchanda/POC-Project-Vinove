import 'package:flutter/material.dart';

class Invite extends StatefulWidget {
  const Invite({Key? key}) : super(key: key);

  @override
  State<Invite> createState() => _InviteState();
}

class _InviteState extends State<Invite> {
  List call = [
    {
      "title": "Ananya",
      "subtitle": "(20) Yesterday,22:49",
      "image": "images/img_6.png",
      "trailing": Icons.videocam,
    },
    {
      "title": "Aditya Narayan Swain",
      "subtitle": "(2) Today, 05:00",
      "image": "images/img.png",
      "trailing": Icons.call,
    },
    {
      "title": "sparsh tandon ",
      "subtitle": "(5) Yesterday, 06:00",
      "image": "images/img_1.png",
      "trailing": Icons.call,
    },
    {
      "title": "kartik",
      "subtitle": "(5) Yesterday, 10:20 ",
      "image": "images/img_7.png",
      "trailing": Icons.call,
    },
    {
      "title": " saini sahab ",
      "subtitle": "(4) Yesterday",
      "image": "images/img_5.png",
      "trailing": Icons.call,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Invite a friend"),
        leading: Icon(
          Icons.arrow_back,

        ),
        actions: [
          Icon(Icons.arrow_back)
        ],
      ),
      body:ListView.builder(
        shrinkWrap: true,
        itemCount: call.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(call[index]["title"]),
          subtitle: Text(call[index]["subtitle"]),
          leading: CircleAvatar(
            backgroundImage: AssetImage(call[index]["image"]),
          ),
          trailing: Icon(call[index]["trailing"],color: Colors.teal,),
        ),
      ),
    );
  }
}
