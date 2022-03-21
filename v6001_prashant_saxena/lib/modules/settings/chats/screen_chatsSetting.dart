import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:v6001_prashant_saxena/widgets/item_settingOption.dart';

import '../../../constants/color.dart';
import '../../../constants/localisation/english_text.dart';
import '../screen_settings.dart';

enum Language { English, French}

class ChatsSetting extends StatelessWidget {
  const ChatsSetting({Key? key}) : super(key: key);


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
          EnglishText.of(context)!.Chats, style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
        ),
        backgroundColor: appBarColor,
      ),

      body: Column(
        children: [
          SettingOption(

              title: EnglishText.of(context)!.AppLang, leading: Icon(CupertinoIcons.globe, color: Colors.grey,), subtitle: 'Phone Language',
              onTap: (){
                PopupMenuButton(
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        child: Text(EnglishText.of(context)!.ClearCallLogs),
                        value: 1,
                      ),
                      PopupMenuItem(
                        child: Text(EnglishText.of(context)!.Settings),
                        value: 2,
                      ),
                    ]
                );
              })

        ],
      ),
    );
  }
}

/*SettingOption(
              title: EnglishText.of(context)!.AppLang, leading: Icon(CupertinoIcons.globe, color: Colors.grey,), subtitle: 'Phone Language',
              onTap: (){
                PopupMenuButton(itemBuilder: (context) => [
                  PopupMenuItem(
                    child: Text('English'),
                    value: 1,
                  ),
                  PopupMenuItem(
                    child: Text('French'),
                    value: 2,
                  ),
                ]);
              })*/


/*PopupMenuButton(
            color: appBarColor,
            onSelected: (String value) {
              setState(() {
                _selection = value;
              });
            },
            child: SettingOption(
              title: EnglishText.of(context)!.AppLang,
              leading: Icon(CupertinoIcons.globe, color: Colors.grey,),
              subtitle: Column(
                children: <Widget>[
                  Text('Sub title'),
                  Text(_selection == null ? 'Nothing selected yet' : _selection.toString()),
                ],
              ),
            ),
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'Value1',
                child: Text(''),
              ),
              const PopupMenuItem<String>(
                value: '2',
                child: Text('French'),
              ),
            ],
          )*/