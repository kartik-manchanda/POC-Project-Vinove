
import 'package:flutter/material.dart';
import 'package:v6001_prashant_saxena/widgets/item_alertDialog.dart';

import '../../../constants/color.dart';
import '../../../constants/localisation/english_text.dart';

class QRCodeScreen extends StatelessWidget {
  const QRCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.grey,
            ),
          ),
          iconTheme: const IconThemeData(
            color: Colors.white, //change your color here
          ),
          title: const Text(
            'QR code',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
          ),
          backgroundColor: appBarColor,
          actions: [
            Icon(Icons.share, color: Colors.grey,),
            PopupMenuButton(
                onSelected: (result){
                  if(result == 1){
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => MyAlertDialogue(
                            title: 'Reset QR code?',
                            content: 'Your existing QR code will no longer work.',
                            opt1: 'KEEP', opt2: 'RESET'
                        )
                      ),
                    );
                  }
                },
                color: appBarColor,
                icon: Icon(Icons.more_vert, color: Colors.grey,),
                itemBuilder: (context) => [
                  PopupMenuItem(child: Text('Reset QR code'), value: 1,)
                ]
            )
          ],
          bottom: TabBar(
            // onTap: (int selected){
            //   setState(() {
            //     _selectedIndex=selected;
            //
            //   });
            // },
            indicatorColor: tabColor,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            indicatorWeight: 3,
            labelStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),
            tabs: [
              Tab(text: EnglishText.of(context)!.Status),
              Tab(text: EnglishText.of(context)!.Calls),
            ],
          ),
        ),
      ),

    );
  }
}
