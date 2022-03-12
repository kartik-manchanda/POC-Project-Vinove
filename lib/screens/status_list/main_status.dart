import 'package:flutter/material.dart';

class StatusHome extends StatefulWidget {
  const StatusHome({Key? key}) : super(key: key);

  @override
  _StatusHomeState createState() => _StatusHomeState();
}

class _StatusHomeState extends State<StatusHome> {
  @override
  Widget build(BuildContext context) {
    return Container  (
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          Card(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: ListTile(
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
                title: Text(
                  "My Status",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text("Tap to add status update"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              "Viewed updates",
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
              child: Container(
                padding: const EdgeInsets.only(top: 6.0),
                color: Colors.white,
                child: ListView(
                  children: <Widget>[
                    ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                            "https://pbs.twimg.com/profile_images/1243950916362895361/Z__-CJxz_400x400.jpg"),
                      ),
                      title: Text(
                        "Kartik",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        " 45 minutes ago",
                      ),
                      //onTap: () => Navigator.push(context,
                      //MaterialPageRoute(builder: (context) => StoryPage())),
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
