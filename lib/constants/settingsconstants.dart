import 'package:flutter/material.dart';
import 'package:sparshtandon_v6000/util/colors.dart';



class MyAppbar extends StatelessWidget {
  final String title;
  const MyAppbar({Key? key,
    required this.title}) : super(key: key);


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
        title: Text(title,
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w400
          ),
        ),
        ),
        backgroundColor: ColorFile.teal_green,
    );
  }
}