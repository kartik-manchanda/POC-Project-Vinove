import 'package:flutter/material.dart';

import '../../constants/color.dart';
import '../../widgets/item_ChatList.dart';

class Chats extends StatelessWidget {
  const Chats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const ChatList(),
      floatingActionButton: FloatingActionButton(
          backgroundColor: tabColor,
          child: const Icon(Icons.message, color: Colors.white,),
          onPressed: () {
          }
      ),

    );
  }
}
