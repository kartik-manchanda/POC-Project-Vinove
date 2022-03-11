import 'package:flutter/material.dart';

import '../../constants/color.dart';
import '../camera/camera.dart';
import 'my_status.dart';

class Status extends StatefulWidget {
  const Status({Key? key}) : super(key: key);

  @override
  _StatusState createState() => _StatusState();
}

class _StatusState extends State<Status> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //     backgroundColor: tabColor,
      //     child: const Icon(Icons.photo_camera, color: Colors.white,),
      //     onPressed: () {
      //     }
      // ),
      body: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const MyStatus(),
            ),
          );
        },
        child: const Padding(
          padding: EdgeInsets.only(top: 8),
          child: ListTile(
            title: Text('My Status',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500
              ),
            ),
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/profile_pic.png'),
              radius: 25,
            ),
            subtitle: Padding(
              padding: EdgeInsets.only(top: 6.0),
              child: Text('Tap to add status update',
                style: TextStyle(fontSize: 15),
              ),
            ),
          )
        ),
      ),

      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom:16.0),
            child: SizedBox(
              height: 45,
              width: 45,
              child: FittedBox(
                child: FloatingActionButton(
                    child: Icon(Icons.edit,color:Colors.white,),
                    backgroundColor: appBarColor,
                    onPressed: () {}),
              ),
            ),
          ),
          FloatingActionButton(

              child: const Icon(Icons.photo_camera, color: Colors.white,),
              backgroundColor: tabColor,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const Camera()));
              }),
        ],
      ),

    );
  }
}
