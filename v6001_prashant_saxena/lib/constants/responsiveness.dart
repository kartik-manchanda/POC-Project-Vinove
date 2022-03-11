import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile_homeLayout;
  final Widget web_homeLayout;
  const Responsive({Key? key, required this.mobile_homeLayout, required this.web_homeLayout}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints){
      if(constraints.maxWidth > 800) {
        return web_homeLayout;
      }
      return mobile_homeLayout;
    });
  }
}
