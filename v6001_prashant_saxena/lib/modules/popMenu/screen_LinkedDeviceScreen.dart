import 'package:flutter/material.dart';
import 'package:v6001_prashant_saxena/widgets/item_elevatedbutton.dart';
import 'package:v6001_prashant_saxena/widgets/item_settingOption.dart';

import '../../constants/color.dart';
import '../../constants/localisation/english_text.dart';

class LinkedDeviceScreen extends StatelessWidget {
  const LinkedDeviceScreen({Key? key}) : super(key: key);

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
          EnglishText.of(context)!.LinkedDevice,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
        ),
        backgroundColor: appBarColor,
      ),
      
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            height: 225,
            color: webAppBarColor,
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset('assets/linked_device.png', scale: 3.5,),
                Text(EnglishText.of(context)!.UseWpOnOtherDevice, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                MyElevatedButton(onPressed: (){}, child: Text(EnglishText.of(context)!.LinkADevice), width: 370,)
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            color: webAppBarColor,
            height: 100,
            child: SettingOption(title: EnglishText.of(context)!.MultiDeviceBeta, leading: Icon(Icons.multitrack_audio), subtitle: EnglishText.of(context)!.MultiDeviceMsg),
          )
        ],
      ),
    );
  }
}
