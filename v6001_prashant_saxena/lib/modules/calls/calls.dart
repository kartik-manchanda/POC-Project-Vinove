import 'package:flutter/material.dart';

import '../../constants/color.dart';
import '../../widgets/item_CallList.dart';


class Calls extends StatefulWidget {
  const Calls({Key? key}) : super(key: key);

  @override
  _CallsState createState() => _CallsState();
}

class _CallsState extends State<Calls> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const CallList(),
      floatingActionButton: FloatingActionButton(
          backgroundColor: tabColor,
          child: const Icon(Icons.add_ic_call_rounded, color: Colors.white,),
          onPressed: () {
          }
      ),

    );
  }
}
