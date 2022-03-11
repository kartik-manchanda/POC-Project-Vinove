import 'package:flutter/material.dart';

import '../../constants/color.dart';
import '../../constants/data.dart';
import '../../widgets/item_messageBar.dart';
import '../../widgets/item_messageList.dart';

class Inbox extends StatefulWidget {
  const Inbox({Key? key}) : super(key: key);

  @override
  _InboxState createState() => _InboxState();
}

class _InboxState extends State<Inbox> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Text(
          data[0]['name'].toString(),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.video_call),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.call),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),

      body: Column(
        children: [
          const Expanded(
            child: MessageList(),
          ),
          MessageBar(),
          // Expanded(
          //   child: Row(
          //     children: [
          //       const MobileChatEntry(),
          //       SizedBox(
          //         height: 45,
          //         width: 45,
          //         child: FittedBox(
          //           child: FloatingActionButton(
          //               child: Icon(Icons.edit,color:Colors.white,),
          //               backgroundColor: appBarColor,
          //               onPressed: () {}),
          //         ),
          //       ),
          //
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}
