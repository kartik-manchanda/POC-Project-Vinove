import 'package:flutter/material.dart';
import 'package:kartik_manchanda_v6016/Constants/colors.dart';

import '../../Constants/inputs.dart';
import '../../database/database_helper_users.dart';
import '../../database/databse_helper_chat.dart';
import '../../models/chat_message.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = FirebaseFirestore.instance;
late auth.User loggedInUser;

class ChatScreen extends StatefulWidget {
  final String name;
  ChatScreen({Key? key, required this.name}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messageTextController = TextEditingController();

  final _auth = auth.FirebaseAuth.instance;
  late String messageText;

  TextEditingController _controller = new TextEditingController();
  String message = "";
  bool _isWritting = false;

  @override
  void initState() {
    getCurrentUser();
    // fetchListMessage();
    super.initState();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      print("mai User$user");
      if (user != null) {
        loggedInUser = user;
        print("phone=${loggedInUser.phoneNumber}");
      }
    } catch (e) {
      print(e);
    }
  }

  // fetchListMessage() async {
  //   rows = await (DataBaseHelperClassChat.instance.queryAll());
  //
  //   if (!rows.isEmpty) {
  //     for (int i = 0; i < rows.length; i++) {
  //       messages.add(
  //         ChatMessage(
  //             messageContent: rows[i]['Chat'],
  //             messageType: rows[i]['columnTypePer']),
  //       );
  //     }
  //   }
  //   setState(() {
  //
  //   });
  //
  //   print("mymessages$rows");
  // }

  void callEmoji() {
    print('Emoji Icon Pressed...');
  }

  void callAttachFile() {
    print('Attach File Icon Pressed...');
  }

  void callCamera() {
    print('Camera Icon Pressed...');
  }

  void callVoice() {
    print('Voice Icon Pressed...');
  }

  void sendMessage() async {
    print('sending message...');
    message = _controller.text;

    _controller.text = "";
    setState(() {});
  }

  Widget moodIcon() {
    return IconButton(
        icon: const Icon(
          Icons.mood,
          color: Color(0xFF00BFA5),
        ),
        onPressed: () => callEmoji());
  }

  Widget attachFile() {
    return IconButton(
      icon: const Icon(Icons.attach_file, color: Color(0xFF00BFA5)),
      onPressed: () => callAttachFile(),
    );
  }

  Widget camera() {
    return IconButton(
      icon: const Icon(Icons.photo_camera, color: Color(0xFF00BFA5)),
      onPressed: () => callCamera(),
    );
  }

  Widget voiceIcon() {
    return const Icon(
      Icons.keyboard_voice,
      color: Colors.white,
    );
  }

  Widget sendIcon() {
    return const Icon(
      Icons.send,
      color: Colors.white,
    );
  }

  List<ChatMessage> messages = [];

  Widget buildInputArea(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12.0),
      height: 60,
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(35.0),
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(0, 2), blurRadius: 7, color: Colors.grey)
                ],
              ),
              child: Row(
                children: [
                  moodIcon(),
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                          hintText: "Message",
                          hintStyle: TextStyle(color: Color(0xFF00BFA5)),
                          border: InputBorder.none),
                    ),
                  ),
                  attachFile(),
                  camera(),
                ],
              ),
            ),
          ),
          const SizedBox(width: 15),
          Container(
            padding: const EdgeInsets.all(15.0),
            decoration: const BoxDecoration(
                color: Color(0xFF00BFA5), shape: BoxShape.circle),
            child: InkWell(
              child: sendIcon(),
              onTap: () => sendMessage(),
            ),
          )
        ],
      ),
    );
  }

  Widget buildMessageList() {
    return ListView.builder(
      itemCount: messages.length,
      shrinkWrap: true,
      padding: EdgeInsets.only(top: 10, bottom: 100),
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
          child: Align(
            alignment: (messages[index].messageType == "receiver"
                ? Alignment.topLeft
                : Alignment.topRight),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: (messages[index].messageType == "receiver"
                    ? Colors.white
                    : Colors.green[100]),
              ),
              padding: EdgeInsets.all(16),
              child: Text(
                messages[index].messageContent,
                style: TextStyle(fontSize: 15),
              ),
            ),
          ),
        );
      },
    );
  }
  //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.teal_green,
        actions: [
          Icon(Icons.videocam_rounded),
          SizedBox(
            width: 25,
          ),
          Icon(Icons.call),
          SizedBox(
            width: 25,
          ),
          Icon(Icons.more_vert),
        ],
        title: Row(
          children: [
            CircleAvatar(
              child: Icon(Icons.person),
            ),
            SizedBox(
              width: 5,
            ),
            Text(widget.name),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MessageStream(),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: messageTextController,
                      onChanged: (value) {
                        messageText = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      messageTextController.clear();
                      _firestore.collection('messages').add({
                        'text': messageText,
                        'sender': loggedInUser.phoneNumber,
                      });
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    // return Scaffold(
    //   backgroundColor: ColorConstants.light_grey,
    //   appBar: AppBar(
    //     backgroundColor: ColorConstants.teal_green,
    //     actions: [
    //       Icon(Icons.videocam_rounded),
    //       SizedBox(
    //         width: 25,
    //       ),
    //       Icon(Icons.call),
    //       SizedBox(
    //         width: 25,
    //       ),
    //       Icon(Icons.more_vert),
    //     ],
    //     title: Row(
    //       children: [
    //         CircleAvatar(
    //           child: Icon(Icons.person),
    //         ),
    //         SizedBox(
    //           width: 5,
    //         ),
    //         Text(widget.name),
    //       ],
    //     ),
    //   ),
    //   body: Stack(
    //     children: [
    //       messages.isEmpty
    //           ? Container(
    //         color: Colors.red,
    //       )
    //           : buildMessageList(),
    //       Align(
    //           alignment: Alignment.bottomCenter,
    //           child: Container(
    //               color: Colors.white, child: buildInputArea(context))),
    //     ],
    //   ),
    // );
  }
}

class MessageStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('messages').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        final messages = snapshot.data?.docs.reversed;
        List<MessageBubble> messageBubbles = [];
        for (var message in messages!) {
          final messageText = message.data() ?? ['text'];
          final messageSender = message.data() ?? ['sender'];

          final currentUser = loggedInUser.email;

          final messageBubble = MessageBubble(
            sender: messageSender.toString(),
            text: messageText.toString(),
            isMe: currentUser == messageSender,
          );
          messageBubbles.add(messageBubble);
        }
        return Expanded(
          child: ListView(
            reverse: true,
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            children: messageBubbles,
          ),
        );
      },
    );
  }
}

class MessageBubble extends StatelessWidget {
  MessageBubble({required this.sender, required this.text, required this.isMe});

  final String sender;
  final String text;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            sender,
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.black54,
            ),
          ),
          Material(
              elevation: 5.0,
              borderRadius: isMe
                  ? BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      bottomLeft: Radius.circular(30.0),
                      bottomRight: Radius.circular(30.0))
                  : BorderRadius.only(
                      bottomLeft: Radius.circular(30.0),
                      bottomRight: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
              color: isMe ? Colors.lightBlueAccent : Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
                child: Text(
                  text,
                  style: TextStyle(
                    color: isMe ? Colors.white : Colors.black54,
                    fontSize: 15.0,
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
