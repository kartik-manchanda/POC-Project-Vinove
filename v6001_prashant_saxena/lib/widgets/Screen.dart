import 'dart:core';
import 'package:flutter/material.dart';
import '../constants/color.dart';

class Screen extends StatelessWidget {
  final String title;
  final body;
  final floatingActionButton;
  final bottomSheet;
  final bottomNavigationBar;
  final persistentFooterButtons;
  const Screen({Key? key,
    required this.title,
    this.body,
    this.floatingActionButton,
    this.bottomSheet,
    this.bottomNavigationBar,
    this.persistentFooterButtons
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: Text(title,
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w400
          ),
        ),
        ),
        backgroundColor: appBarColor,
        floatingActionButton: floatingActionButton,
        bottomSheet: bottomSheet,
        bottomNavigationBar: bottomNavigationBar,
        persistentFooterButtons: persistentFooterButtons,


    );
  }
}
//
//     PreferredSizeWidget? appBar,
// Widget? body,
//     Widget? floatingActionButton,
// FloatingActionButtonLocation?
// floatingActionButtonLocation,
//     FloatingActionButtonAnimator?
// floatingActionButtonAnimator,
// List ? persistentFooterButtons,
//     Widget? drawer,
// void Function(bool)? onDrawerChanged,
//     Widget? endDrawer,
// void Function(bool)? onEndDrawerChanged,
//     Widget? bottomNavigationBar,
// Widget? bottomSheet,
//     Color? backgroundColor,
// bool? resizeToAvoidBottomInset,
//     bool primary = true,
// DragStartBehavior drawerDragStartBehavior =
//     DragStartBehavior.start,
//     bool extendBody = false,
// bool extendBodyBehindAppBar = false,
//     Color? drawerScrimColor,
// double? drawerEdgeDragWidth,
//     bool drawerEnableOpenDragGesture = true,
// bool endDrawerEnableOpenDragGesture = true,
//     String? restorationId,