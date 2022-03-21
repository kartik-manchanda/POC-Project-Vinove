import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:v6001_prashant_saxena/constants/color.dart';

class MyAlertDialogue extends StatelessWidget {
  final String title;
  final String content;
  final String opt1;
  final String opt2;
  const MyAlertDialogue({Key? key,
    required this.title,
    required this.content,
    required this.opt1,
    required this.opt2
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
      child: AlertDialog(
        elevation: 10,
        backgroundColor: mobileChatBoxColor,
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: Text(opt1, style: TextStyle(color: tabColor),),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: Text(opt2, style: TextStyle(color: tabColor),),
          ),
        ],
      ),
    );
  }
}
