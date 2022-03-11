import 'package:flutter/material.dart';

import '../constants/color.dart';

class ProfileBox extends StatelessWidget {
  final double height;
  final double width;
  final double size;
  final double bottom;
  final double right;
  final icon;
  const ProfileBox({Key? key, required this.height, required this.width, required this.bottom, required this.right, this.icon, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        CircleAvatar(
          radius: 60,
          backgroundImage: AssetImage('assets/profile_pic.png'),
        ),
        Positioned(
          bottom: bottom,
          right: right,
          child: Container(
            height: height,
            width: width,
            child: Icon(icon,
              color: Colors.white,
              size: size,
            ),
            decoration: BoxDecoration(
                color: tabColor, shape: BoxShape.circle),
          ),
        ),
      ],
    );
  }
}
