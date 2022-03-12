import 'package:flutter/material.dart';

import '../../constants/data.dart';
import '../../util/colors.dart';

class ChatsHome extends StatefulWidget {
  const ChatsHome({Key? key}) : super(key: key);

  @override
  _ChatsHomeState createState() => _ChatsHomeState();
}

class _ChatsHomeState extends State<ChatsHome> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.message_rounded,
        ),
        backgroundColor: ColorFile.teal_green,
        onPressed: (){},
      ),
      body: ListView.builder(


          itemCount: whatsapp.length,
          itemBuilder: (context, index) => ListTile(
            title: Text(whatsapp[index]["title"]),
            subtitle:Text(whatsapp[index]["subtitle"]),
            leading: CircleAvatar(backgroundImage: AssetImage(whatsapp[index]["image"]),
              ),
            trailing: Text(whatsapp[index]["trailing"]),
          )),
    );
  }
}
