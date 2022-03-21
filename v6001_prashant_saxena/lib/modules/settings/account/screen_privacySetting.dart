import 'package:flutter/material.dart';

import '../../../constants/color.dart';
import '../../../constants/localisation/english_text.dart';

class PrivacySetting extends StatelessWidget {
  const PrivacySetting({Key? key}) : super(key: key);

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
        title: Text(
          EnglishText.of(context)!.Privacy, style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
        ),
        backgroundColor: appBarColor,
      ),

    );
  }
}
