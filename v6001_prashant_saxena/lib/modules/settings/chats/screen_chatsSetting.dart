import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:v6001_prashant_saxena/constants/theme/change_theme_button_widget.dart';
import '../../../constants/color.dart';
import '../../../constants/localisation/strings.dart';
import '../../../constants/prefrences.dart';
import '../../../main.dart';
import '../../../widgets/item_settingOption.dart';
import '../screen_settings.dart';

enum Language { English, French }

class ChatsSetting extends StatefulWidget {
  const ChatsSetting({Key? key}) : super(key: key);

  @override
  State<ChatsSetting> createState() => _ChatsSettingState();
}

class _ChatsSettingState extends State<ChatsSetting> {
  int _langGroup = -1;
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
          Strings.of(context)!.Chats,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
        ),
        backgroundColor: appBarColor,
      ),
      body: Column(
        children: [
          ChangeThemeButtonWidget(),
          SettingOption(
              title: Strings.of(context)!.AppLang, leading: Icon(CupertinoIcons.globe, color: Colors.grey,), subtitle: 'Phone Language',
              onTap: (){
                showDialog(context: context, builder: (context) => SimpleDialog(
                  backgroundColor: backgroundColor,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      alignment: Alignment.center,
                      child: RadioListTile<int>(
                        value: 0,
                        groupValue: _langGroup,
                        onChanged: (value) {
                          setState(() {
                            _langGroup = value ?? 0;
                          });
                          MyApp.setLocale(context, Locale("en"));
                          Preference.setString(Preference.language, "en");
                        },
                        title: Text(
                          Strings.of(context)!.English,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      alignment: Alignment.center,
                      child: RadioListTile<int>(
                        value: 1,
                        groupValue: _langGroup,
                        onChanged: (value) {
                          setState(() {
                            _langGroup = value ?? 0;
                          });
                          MyApp.setLocale(context, Locale("fr"));
                          Preference.setString(Preference.language, "fr");
                        },
                        title: Text(
                          Strings.of(context)!.French,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),);
              }),
        ],
      ),
    );
  }
}
