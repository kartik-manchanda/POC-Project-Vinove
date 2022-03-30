import 'package:flutter/material.dart';

import '../../Constants/colors.dart';



class CallsListPage extends StatefulWidget {
  const CallsListPage({Key? key}) : super(key: key);

  @override
  _CallsListPageState createState() => _CallsListPageState();
}

class _CallsListPageState extends State<CallsListPage> {
  List<Map<String,dynamic>> calls=[
    {
      "name":"kartik",
      "day_time":"today,22:03",
      "photo":Icons.person,
      "status":"incoming",
      "call": Icons.videocam_rounded,


    },
    {
      "name":"aditya",
      "day_time":"today,22:03",
      "photo":Icons.person,
      "status":"missed call",
      "call": Icons.videocam_rounded,


    },
    {
      "name":"sparsh",
      "day_time":"today,22:03",
      "photo":Icons.person,
      "status":"incoming",
      "call": Icons.videocam_rounded,


    },
    {
      "name":"ananya",
      "day_time":"yesterday,22:03",
      "photo":Icons.person,
      "status":"called",
      "call": Icons.videocam_rounded,


    },


  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(

            child: Icon(Icons.add_call),
            backgroundColor: ColorConstants.teal_green_light,
            onPressed: () {}),
      body: ListView.builder(
          itemCount: calls.length,
          itemBuilder: (context,index)=>ListTile(
            title: Text(calls[index]['name'].toString(),style: TextStyle(color: ColorConstants.black),),
            subtitle:Row(
              children: [
                Icon(Icons.call_made,color: Colors.green),

                Text(calls[index]['day_time'].toString()),
              ],
            ),
            leading: CircleAvatar(
              child: Icon(calls[index]['photo']),
            ),
            //changed
            trailing: Icon(calls[index]['call'],color: ColorConstants.teal_green,),
          )),
    );
  }
}
