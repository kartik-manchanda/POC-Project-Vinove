import 'package:flutter/material.dart';

class SubMenu extends StatefulWidget {
  const SubMenu({Key? key}) : super(key: key);

  @override
  _SubMenuState createState() => _SubMenuState();
}

class _SubMenuState extends State<SubMenu> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: Icon(Icons.more_vert),
      //onSelected: (WhyFarther result) { setState(() { _selection = result; }); },
      itemBuilder: (BuildContext context) => <PopupMenuEntry>[
        const PopupMenuItem(
          value: 1,
          child: Text('Report'),
        ),
        const PopupMenuItem(
          value: 2,
          child: Text('Block'),
        ),
        const PopupMenuItem(
          value: 3,
          child: Text('Clear Chat'),
        ),
        const PopupMenuItem(
          value: 4,
          child: Text('Export Chat'),
        ),
        const PopupMenuItem(
          value: 5,
          child: Text('Add ShortCut'),
        ),
      ],
    );
  }
}
