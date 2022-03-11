import 'package:flutter/material.dart';
import 'package:kartik_manchanda_v6016/Constants/colors.dart';

import '../../models/chat_message.dart';

class ChatScreen extends StatefulWidget {
  final String name;
  const ChatScreen({Key? key, required this.name}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
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

  List<ChatMessage> messages = [
    ChatMessage(messageContent: "Hello, Will", messageType: "receiver"),
    ChatMessage(messageContent: "How have you been?", messageType: "receiver"),
    ChatMessage(
        messageContent: "Hey Kriss, I am doing fine dude. wbu?",
        messageType: "sender"),
    ChatMessage(
        messageContent: "Hey Kriss, I am doing fine dude. wbu?",
        messageType: "sender"),
    ChatMessage(
        messageContent: "Hey Kriss, I am doing fine dude. wbu?",
        messageType: "sender"),
    ChatMessage(
        messageContent: "Hey Kriss, I am doing fine dude. wbu?",
        messageType: "sender"),
    ChatMessage(
        messageContent: "Hey Kriss, I am doing fine dude. wbu?",
        messageType: "sender"),
    ChatMessage(
        messageContent: "Hey Kriss, I am doing fine dude. wbu?",
        messageType: "sender"),
  ];

  TextEditingController _controller = new TextEditingController();
  String message = "";
  bool _isWritting = false;

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
                  const Expanded(
                    child: TextField(
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
              child: voiceIcon(),
              onLongPress: () => callVoice(),
            ),
          )
        ],
      ),
    );
  }
  // Widget buildInputArea(BuildContext context) {
  //   return Padding(
  //     padding: const EdgeInsets.all(8.0),
  //     child: Row(
  //       children: <Widget>[
  //         Expanded(
  //           child: TextField(
  //             cursorColor: Colors.red,
  //             keyboardType: TextInputType.multiline,
  //             controller: _controller,
  //             decoration: InputDecoration(
  //                 hintText: 'Message',
  //                 contentPadding: const EdgeInsets.all(15),
  //                 border: OutlineInputBorder(
  //                     borderRadius: BorderRadius.circular(30))),
  //             onChanged: (value) {
  //               message = value;
  //
  //               // do something
  //             },
  //           ),
  //         ),
  //         RawMaterialButton(
  //           onPressed: () {
  //             messages.add(
  //               ChatMessage(messageContent: message, messageType: "sender"),
  //             );
  //             _controller.text = "";
  //             setState(() {});
  //           },
  //           elevation: 2.0,
  //           fillColor: ColorConstants.teal_green_light,
  //           child: Icon(
  //             Icons.send,
  //             size: 20,
  //             color: ColorConstants.light_grey,
  //           ),
  //           padding: EdgeInsets.all(10.0),
  //           shape: CircleBorder(),
  //         )
  //       ],
  //     ),
  //   );
  // }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.light_grey,
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
      body: Stack(
        children: [
          buildMessageList(),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  color: Colors.white, child: buildInputArea(context))),
        ],
      ),
    );
  }
}
