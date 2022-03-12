import 'package:flutter/material.dart';

import '../Camera_list/CameraPage.dart';

class StatusPage extends StatefulWidget {
  const StatusPage({Key? key}) : super(key: key);

  @override
  State<StatusPage> createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Container(
              height: 45,
              width: 45,
              child: FittedBox(
                child: FloatingActionButton(
                    child: Icon(
                      Icons.edit,
                      color: Colors.grey[900],
                    ),
                    backgroundColor: Colors.grey[300],
                    onPressed: () {}),
              ),
            ),
          ),
          FloatingActionButton(
              child: Icon(Icons.camera_alt),
              backgroundColor: Colors.teal,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CameraScreen()));
              }),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text("My status"),
              subtitle: Text("Tap to add status update"),
              leading: Stack(
                children: <Widget>[
                  CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                          "https://cdn2.vectorstock.com/i/1000x1000/23/81/default-avatar-profile-icon-vector-18942381.jpg")),
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
              padding: const EdgeInsets.all(16.0),
              child: Text("Recent updates"),
            )
          ],
        ),
      ),
    );
  }
}
