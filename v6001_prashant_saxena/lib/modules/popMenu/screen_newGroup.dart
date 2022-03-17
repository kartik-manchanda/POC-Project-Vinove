import 'package:flutter/material.dart';

import '../../constants/color.dart';

class NewGroupScreen extends StatelessWidget {
  const NewGroupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Newwhatsapp Contacts',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            Text(
              'Add Participants',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            ),
          ],
        ),
        backgroundColor: appBarColor,
        actions: [
          Icon(Icons.search, color: Colors.white,),
        ],
      ),

      //body: ,

      floatingActionButton: FloatingActionButton(
          backgroundColor: tabColor,
          child: const Icon(Icons.arrow_forward, color: Colors.white,),
          onPressed: () {
            // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ChatContacts(),),);
          }
      ),
    );
  }
}
