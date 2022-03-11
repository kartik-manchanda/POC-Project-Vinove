import 'package:flutter/material.dart';

import '../constants/color.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: webAppBarColor,
        child: Column(
          children: [
            Image.asset('assets/wp_logo.png', scale: 9,),
            SizedBox(height: 200,),
            Column(
              children: [
                Text('from', style: TextStyle(
                  fontSize: 15,
                ),),
                Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                  Image.asset('assets/meta.png', scale: 30,),
                  Text('Meta', style: TextStyle(fontSize: 25, color: Colors.white),)
                ],),
              ],
            )
            
          ],
        ),

      ),
    );
  }
}
