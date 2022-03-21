import 'package:flutter/material.dart';
import 'package:v6001_prashant_saxena/modules/settings/screen_invite.dart';
import 'package:v6001_prashant_saxena/widgets/item_settingOption.dart';

import '../../constants/color.dart';
import '../../constants/localisation/english_text.dart';

class ChatContacts extends StatelessWidget {
  const ChatContacts({Key? key}) : super(key: key);

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
        title: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              EnglishText.of(context)!.SelectContacts,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            Text(
              '10 Contacts',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            ),
          ],
        ),
        backgroundColor: appBarColor,
        actions: [
          Icon(Icons.search, color: Colors.white,),
          PopupMenuButton(
              onSelected: (result){
                if(result == 1){
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const InvitePage(),
                    ),
                  );
                }
                else if(result == 2){
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const InvitePage(),
                    ),
                  );
                }
                else if(result == 2){
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const InvitePage(),
                    ),
                  );
                }
                else {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const InvitePage(),
                    ),
                  );
                }
              },
              color: appBarColor,
              icon: Icon(Icons.more_vert),
              itemBuilder: (context) => [
                PopupMenuItem(child: Text(EnglishText.of(context)!.InviteFriend), value: 1,),
                PopupMenuItem(child: Text(EnglishText.of(context)!.Contacts), value: 2,),
                PopupMenuItem(child: Text(EnglishText.of(context)!.Refresh), value: 3,),
                PopupMenuItem(child: Text(EnglishText.of(context)!.Help), value: 4,),
              ]
          )
        ],
      ),
      
      body: Column(
        children: [
          SettingOption(
              title: EnglishText.of(context)!.NewGroup,
              leading: Icon(Icons.people, color: tabColor,),
          ),
          SettingOption(
              title: EnglishText.of(context)!.NewContact,
              trailing: Icon(Icons.qr_code),
              leading: Icon(Icons.person_add, color: tabColor,),
          ),
          //contact list
        ],
      ),
    );
  }
}
