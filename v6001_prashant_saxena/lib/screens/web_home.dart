import 'package:flutter/material.dart';

import '../widgets/item_messageList.dart';
import '../widgets/item_ChatList.dart';
import '../widgets/item_chatInput.dart';
import '../widgets/web/web_appbar.dart';
import '../widgets/web/web_chatbar.dart';
import '../widgets/web/web_searchbar.dart';

class WebHome extends StatefulWidget {
  const WebHome({Key? key}) : super(key: key);

  @override
  _WebHomeState createState() => _WebHomeState();
}

class _WebHomeState extends State<WebHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: const [
                  WebAppBar(),
                  WebSearchBar(),
                  ChatList(),
                ],
              ),
            ),
          ),
        Container(
          width: MediaQuery.of(context).size.width*0.65,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background.jpg'),
              fit: BoxFit.cover
            ),
          ),
          child: Column(
            children: const [
              WebChatbar(),
              Expanded(child: MessageList()),
              ChatInput()
            ],
          ),
        )
        ],

      ),
    );
  }
}
