import 'package:flutter/material.dart';
import 'package:kartik_manchanda_v6016/widgets/status_paint.dart';
import 'package:kartik_manchanda_v6016/widgets/story_page_view.dart';

class OthersStatus extends StatelessWidget {
 final bool isSeen;
 final int statusNum;
  const OthersStatus({Key? key,required this.statusNum,required this.isSeen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CustomPaint(
        painter: StatusPainter(isSeen:isSeen ,statusNum:statusNum ),
        child: CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(
              "https://www.gradjobs.co.uk/documents/blog/motivationjpeg-2245.jpeg"),
        ),
      ),
      title: Text(
        "Sparsh",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text("Today, 09:20 AM"),
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => StoryPageView())),
    );
  }
}
