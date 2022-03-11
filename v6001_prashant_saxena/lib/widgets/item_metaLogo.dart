import 'package:flutter/material.dart';

class MetaLogo extends StatelessWidget {
  const MetaLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 80,
      child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('from', style: TextStyle(fontSize: 13, color: Colors.grey)),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            Image.asset('assets/meta.png', scale: 50,),
            Text('Meta', style: TextStyle(fontSize: 15))
          ],)
        ],
      ),
    );
  }
}
