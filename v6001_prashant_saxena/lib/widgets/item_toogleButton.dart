import 'package:flutter/material.dart';
import 'package:v6001_prashant_saxena/constants/color.dart';

class MyToogleButton extends StatefulWidget {
  const MyToogleButton({Key? key}) : super(key: key);

  @override
  State<MyToogleButton> createState() => _MyToogleButtonState();
}

class _MyToogleButtonState extends State<MyToogleButton> {
  bool isSwitched = false;
  void toggleSwitch(bool value) {

    if(isSwitched == false)
    {
      setState(() {
        isSwitched = true;
      });
    }
    else
    {
      setState(() {
        isSwitched = false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[ Transform.scale(
            scale: 0.9,
            child: Switch(
              onChanged: toggleSwitch,
              value: isSwitched,
              activeColor: tabColor,
              activeTrackColor: messageColor,
              inactiveThumbColor: Colors.grey,
              inactiveTrackColor: searchBarColor,
            )
        ),
        ]);
  }
}
