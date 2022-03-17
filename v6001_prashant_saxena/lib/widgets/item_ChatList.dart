import 'package:flutter/material.dart';

import '../constants/data.dart';
import '../modules/chats/screen_inbox.dart';


class ChatList extends StatefulWidget {
  const ChatList({Key? key}) : super(key: key);

  @override
  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  @override
  Widget build(BuildContext context) {
    return
      Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              InkWell(
                // onLongPress: (),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const Inbox(),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: ListTile(
                    title: Text(
                      data[index]['name'].toString(),
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 6.0),
                      child: Text(
                        data[index]['message'].toString(),
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                        data[index]['profilePic'].toString(),
                      ),
                      radius: 25,
                    ),
                    trailing: Text(
                      data[index]['time'].toString(),
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}