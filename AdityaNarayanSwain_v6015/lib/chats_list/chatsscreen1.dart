import 'package:flutter/material.dart';

import '../constants/ColorConstants.dart';
import '../message/message.dart';

class Chatscreen1 extends StatefulWidget {
  const Chatscreen1({Key? key}) : super(key: key);

  @override
  State<Chatscreen1> createState() => _Chatscreen1State();
}

class _Chatscreen1State extends State<Chatscreen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.Teal_green,
        titleSpacing: 0.0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 17,
              backgroundImage: AssetImage('images/img_3.png'),
            ),
            Padding(
              padding: EdgeInsets.only(left: 6.0),
              child: Text('Aditi'),
            )
          ],
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.videocam),
              onPressed: () {
                print('Video Call Button Clicked');
              }),
          IconButton(
              icon: Icon(Icons.call),
              onPressed: () {
                print('Call Button Clicked');
              }),
          IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {
                print('Three Dot Button Clicked');
              }),
        ],
      ),
      body: Column(
        children: [
          Expanded(child: MessagePage(key: null,)),
          Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                Flexible(
                  child: TextFormField(
                    minLines: 1,
                    maxLines: 5,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(color: Colors.grey, width: 0.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(color: Colors.grey, width: 0.0),
                      ),
                      hintText: 'Type a message',
                        prefixIcon: Icon(Icons.emoji_emotions_outlined ),
                        suffixIcon: Icon(Icons.send),

                        iconColor: AppColors.teal_dark_green,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:flutter_sms/flutter_sms.dart';
//
// void main(){
//
//   runApp(MyApp());
//
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Home(),
//     );
//   }
// }
//
// List<String> recipents = ["9876543210", "8765432190"];
//
// class Home extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Send sms to multiple"),),
//       body: Container(
//
//         child: Center(
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: RaisedButton(
//               color: Theme.of(context).accentColor,
//               padding: EdgeInsets.symmetric(vertical: 16),
//               child: Text("Send Sms",
//                   style: Theme.of(context).accentTextTheme.button),
//               onPressed: () {
//                 _sendSMS("This is a test message!", recipents);
//               },
//             ),
//           ),
//         ),
//
//       ),
//     );
//   }
//
//
//
// }
//
// void _sendSMS(String message, List<String> recipents) async {
//   String _result = await sendSMS(message: message, recipients: recipents)
//       .catchError((onError) {
//     print(onError);
//   });
//   print(_result);
// }
