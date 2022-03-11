import 'package:flutter/material.dart';
import 'package:v6001_prashant_saxena/constants/color.dart';

import '../../widgets/item_elevatedbutton.dart';
import '../../widgets/item_elevatedbutton.dart';

class ChangeNum extends StatelessWidget {
  const ChangeNum({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
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
          'Change Number', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
        ),
        backgroundColor: appBarColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SizedBox(height: 700,
          child: Center(
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Container(height: 300,child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                    Container(height: 100,width: 100, decoration: BoxDecoration(color: Colors.greenAccent.withOpacity(0.2),shape: BoxShape.circle),),
                    Text('Changing your phone number will migrate your account info, groups & settings.', style: TextStyle(fontSize: 15),),
                    Text('Before procedding, please confirm that you are able to receive SMS or calls at your new number.\n\nIf you have both a new phone & a new number, first change your number on your old phone.', style: TextStyle(fontSize: 13, color: Colors.grey),),

                ],
              ),
            ),
                MyElevatedButton(
                    onPressed: (){},
                    width: 80,
                    height: 40,
                    child: const Text('Next', style: TextStyle(color: backgroundColor),))
              ]
          ),
        ),)
      )
    );
  }
}
