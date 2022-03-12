import 'package:flutter/material.dart';

class CallsListPage extends StatefulWidget {
  const CallsListPage({Key? key}) : super(key: key);

  @override
  State<CallsListPage> createState() => _CallsListPageState();
}

class _CallsListPageState extends State<CallsListPage> {
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
      floatingActionButton: FloatingActionButton(

          child: Icon(Icons.add_call),
          backgroundColor: Colors.teal,
          onPressed: () {}),
      body: ListView.builder(
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
