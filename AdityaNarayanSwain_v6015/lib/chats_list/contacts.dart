import 'package:adityanarayanswain_v6015/constants/ColorConstants.dart';
import 'package:flutter/material.dart';

class Contacts extends StatefulWidget {
  const Contacts({Key? key}) : super(key: key);

  @override
  State<Contacts> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  List chats = [
    {
      "title": "Aditya Narayan Swain",
      "subtitle": "hey",
      "image": "images/img.png",
    },
    {
      "title": "sparsh tandon ",
      "subtitle": "hii bhai ",
      "image": "images/img_1.png",
    },
    {
      "title": "kartik",
      "subtitle": "hey buddy ",
      "image": "images/img_7.png",
    },
    {
      "title": "Aditi jamwal",
      "subtitle": "hiii",
      "image": "images/img_3.png",
    },
    {
      "title": "Ankush tyagi ",
      "subtitle": "hello",
      "image": "images/img_4.png",
    },
    {
      "title": " Saini sahab ",
      "subtitle": "hello",
      "image": "images/img_5.png",
    },
    {
      "title": "Ananya",
      "subtitle": "Bhai",
      "image": "images/img_6.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.teal_dark_green,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Search Contacts",
            ),
            GestureDetector(
              child: Text('7 contacts ', style: TextStyle(fontSize: 10)),
              onTap: () {
                print("tapped subtitle");
              },
            ),
            // IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          ],
        ),

      ),
      body: ListView.builder(
        shrinkWrap: true,

        itemCount: chats.length,
        itemBuilder: (context, index) => ListTile(
          // onTap: (){
          //   Navigator.of(context).push(MaterialPageRoute(builder: (context)=>conta()));
          // },



          title: Text(chats[index]["title"]),
          subtitle: Text(chats[index]["subtitle"]),
          leading: CircleAvatar(
            backgroundImage: AssetImage(chats[index]["image"]),
          ),
        ),
      ),
    );
  }
}
