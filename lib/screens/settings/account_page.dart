import 'package:flutter/material.dart';
import 'package:sparshtandon_v6000/screens/settings/settingsMain.dart';

import '../../constants/data.dart';
import '../../util/colors.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Account',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: ColorFile.teal_green,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context)
                  .pop();
            }),
      ),
      body:  Column(
        children: [
          Expanded(
            child: ListView.builder(
              //shrinkWrap: true,
              itemCount: accountpage.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(accountpage[index]["title"]),
                //subtitle: Text(settings[index]["subtitle"]),
                leading: accountpage[index]["image"],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
