import 'package:flutter/material.dart';

import '../util/colors.dart';

class MyAppBar extends StatelessWidget {
  final String title;
  MyAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title,
      style: TextStyle(
        color: Colors.white,
      ),),
      backgroundColor: ColorFile.teal_green,
      leading: Icon(Icons.arrow_back),

    );
  }
}
