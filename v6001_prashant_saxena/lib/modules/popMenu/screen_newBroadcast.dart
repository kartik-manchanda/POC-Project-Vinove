import 'package:flutter/material.dart';

import '../../constants/color.dart';

class NewBroadcastScreen extends StatelessWidget {
  const NewBroadcastScreen({Key? key}) : super(key: key);

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
              'New Broadcast',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            Text(
              '0 of 256 selected',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            ),
          ],
        ),
        backgroundColor: appBarColor,
        actions: [
          Icon(Icons.search, color: Colors.white,),
        ],
      ),

      body: Column(crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(alignment: Alignment.center,padding: EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10),
            child: Text('Only contacts with +91 1234567890 in their address book wil receive your broadcast messages.',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12
            ),),
          ),
          Divider( endIndent: 10, indent: 10,thickness: 0.5,),
          //contact list
        ],
      ),

      floatingActionButton: FloatingActionButton(
          backgroundColor: tabColor,
          child: const Icon(Icons.check, color: Colors.white,),
          onPressed: () {
            // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ChatContacts(),),);
          }
      ),
    );
  }
}
