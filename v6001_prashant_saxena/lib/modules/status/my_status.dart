import 'package:flutter/material.dart';

import '../../constants/color.dart';
import '../../widgets/item_statusList.dart';

class MyStatus extends StatefulWidget {
  const MyStatus({Key? key}) : super(key: key);

  @override
  _MyStatusState createState() => _MyStatusState();
}

class _MyStatusState extends State<MyStatus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: const Text(
          'My Status', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
        ),
        backgroundColor: appBarColor,
      ),
      body: const StatusList(),
      floatingActionButton: FloatingActionButton(
          backgroundColor: tabColor,
          child: const Icon(Icons.photo_camera, color: Colors.white,),
          onPressed: () {
          }
      ),
    );

  }
}
