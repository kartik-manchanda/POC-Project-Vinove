import 'package:flutter/material.dart';
import 'package:v6001_prashant_saxena/modules/chats/archived/screen_archivedSetting.dart';
import '../../../constants/color.dart';
import '../../../constants/localisation/strings.dart';

class ArchivedScreen extends StatelessWidget {
  const ArchivedScreen({Key? key}) : super(key: key);

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
          Strings.of(context)!.Archived,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
        ),
        backgroundColor: appBarColor,
        actions: [
          PopupMenuButton(
              onSelected: (result){
                if(result == 1){
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ArchivedSetting(),
                    ),
                  );
                }
              },
              color: appBarColor,
              icon: Icon(Icons.more_vert),
              itemBuilder: (context) => [
                PopupMenuItem(child: Text('Archived Setting'), value: 1,)
              ]
          )
        ],
      ),
    );
  }
}
