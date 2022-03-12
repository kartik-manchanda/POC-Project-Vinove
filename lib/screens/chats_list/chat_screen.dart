import 'package:flutter/material.dart';
import 'package:sparshtandon_v6000/screens/chats_list/messagepage.dart';
import 'package:sparshtandon_v6000/util/colors.dart';
import 'package:sparshtandon_v6000/widgets/submenu.dart';

class Scratch extends StatefulWidget {
  const Scratch({Key? key}) : super(key: key);

  @override
  _ScratchState createState() => _ScratchState();
}

class _ScratchState extends State<Scratch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Aditya',
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.white,
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(6.0),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/images/img_avatar.png'),
            radius: 20.0,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.videocam),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.call)),
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            //onSelected: (WhyFarther result) { setState(() { _selection = result; }); },
            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
              const PopupMenuItem(
                value: 1,
                child: Text('View Contact'),
              ),
              const PopupMenuItem(
                value: 2,
                child: Text('Media, links and docs'),
              ),
              const PopupMenuItem(
                value: 3,
                child: Text('Search'),
              ),
              const PopupMenuItem(
                value: 4,
                child: Text('Mute Notifications'),
              ),
              const PopupMenuItem(
                value: 5,
                child: Text('Wallpaper'),
              ),
              const PopupMenuItem(
                value: 6,
                child: Text('More'),
              ),
            ],
          ),
        ],
        backgroundColor: ColorFile.teal_green,
      ),
      body:  Column(
        children: [
          Expanded(child: MessagePage(key: null,)),
          Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                Flexible(
                  child: TextFormField(
                    minLines: 1,
                    maxLines: 5,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(color: Colors.grey, width: 0.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(color: Colors.grey, width: 0.0),
                      ),
                      hintText: 'Type a message',
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
