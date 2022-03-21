import 'package:flutter/material.dart';

import '../../constants/color.dart';
import '../../constants/data.dart';
import '../../constants/localisation/english_text.dart';

class CallInfo extends StatelessWidget {
  const CallInfo({Key? key}) : super(key: key);

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
        title: Text(
          EnglishText.of(context)!.CallInfo, style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
        ),
        backgroundColor: appBarColor,
        actions: [
            IconButton(onPressed: (){}, icon: const Icon(Icons.message)),
            IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert))
          ],
      ),
      body: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage('https://i.pinimg.com/564x/c2/e0/13/c2e0139619f88f43ee7206e7a08f65a2.jpg'
            // calldata[index]['profilePic'].toString(),
          ),
          radius: 30,
        ),
        title: Text('Aditya',
          // calldata[index]['name'].toString(),
          style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500
          ),
        ),
        trailing: Row(crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            IconButton(onPressed: (){}, icon: Icon(
              Icons.videocam_rounded,
              color: tabColor,
            ),),
            IconButton(onPressed: (){}, icon: Icon(
              Icons.call,
              color: tabColor,
            ),)
          ],
        ),
      ),
    );
  }
}
