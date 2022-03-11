import 'package:flutter/material.dart';

import '../../constants/color.dart';

class WebAppBar extends StatelessWidget {
  const WebAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.077,
      width : MediaQuery.of(context).size.width * 0.35,
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: webAppBarColor,
        border: Border(right: BorderSide(color: dividerColor))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/profile_pic.png'),
            radius: 20,
          ),
          Row(children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add_circle_outline, color: Colors.grey),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.comment, color: Colors.grey),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert, color: Colors.grey),
            ),
          ],)
        ],
    ),
    );
  }
}
