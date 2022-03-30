import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import '../../Constants/colors.dart';

import '../../utils/localisations/app-translations.dart';
import '../../widgets/other_status.dart';
import '../../widgets/story_page_view.dart';
import '../camera/camera_screen.dart';
import "package:story_view/story_view.dart";


class StatusPage extends StatefulWidget {
  const StatusPage({Key? key}) : super(key: key);

  @override
  _StatusPageState createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {

  List recent_updates=[
    {
      "name":"kartik",
      "timedy":"Today,09:20 AM",
      "image":""
    }


  ];
  List viewed_updates=[

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,

        children: [
          Padding(
            padding: const EdgeInsets.only(bottom:16.0),
            child: Container(
              height: 45,
              width: 45,
              child: FittedBox(
              child: FloatingActionButton(
                  

                    child: Icon(Icons.edit,color:Colors.grey[900],),
                    backgroundColor: Colors.grey[300],
                    onPressed: () {}),
              ),
            ),
          ),

          FloatingActionButton(

              child: Icon(Icons.camera_alt),
              backgroundColor: ColorConstants.teal_green_light,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>CameraScreen()));
              }),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text(AppTranslations.of(context)!.text("my_status")),
              subtitle: Text(AppTranslations.of(context)!.text("add_status")),
              leading: Stack(
                children: <Widget>[
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                        "https://cdn2.vectorstock.com/i/1000x1000/23/81/default-avatar-profile-icon-vector-18942381.jpg"),
                  ),
                  Positioned(
                    bottom: 0.0,
                    right: 1.0,
                    child: Container(
                      height: 20,
                      width: 20,
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 15,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.green, shape: BoxShape.circle),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Recent updates",
                style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left:0.0),
              color: Colors.white,
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  OthersStatus(isSeen: false, statusNum: 5,),
                  OthersStatus(isSeen: false, statusNum: 1,),

                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Viewed updates",
                style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
              ),
            ),




















            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left:0.0),
                color: Colors.white,
                child: ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    OthersStatus(isSeen: true, statusNum: 5,),
                    OthersStatus(isSeen: true, statusNum: 1,),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
