import 'package:flutter/material.dart';

import '../../constants/data.dart';
import '../../util/colors.dart';

class CallsHome extends StatefulWidget {
  const CallsHome({Key? key}) : super(key: key);

  @override
  _CallsHomeState createState() => _CallsHomeState();
}

class _CallsHomeState extends State<CallsHome> {
  @override




  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.call,
        ),
        backgroundColor: ColorFile.teal_green,
        onPressed: (){},
      ),
      body: ListView.builder(


          itemCount: Calls.length,
          itemBuilder: (context, index) => ListTile(
              title: Text(Calls[index]["title"]),
              subtitle: Row(
                children: [
                  Icon(Icons.call_made,
                    color: ColorFile.teal_green,),

                  Text(Calls[index]["subtitle"])
                ],
              ),
              leading: CircleAvatar(backgroundImage: AssetImage(Calls[index]["image"]),
                ),
              trailing: Icon(Icons.call,
                color: ColorFile.teal_green,)
          )),
    );
  }
}
