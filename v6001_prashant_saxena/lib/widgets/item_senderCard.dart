import 'package:flutter/material.dart';

import '../constants/color.dart';

class Sendercard extends StatelessWidget {
  final String message;
  final String date;
  const Sendercard({Key? key, required this.message, required this.date}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child:
      //imposes additional constraints on its child
      ConstrainedBox(
        constraints: BoxConstraints(
          //to not stick to boundary
          maxWidth: MediaQuery.of(context).size.width-100,
        ),
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          color: messageColor,
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Stack(
            children: [
              Padding(padding: EdgeInsets.only(left: 10, right: 30, top: 5, bottom: 20),
                child: Text(
                  message,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),),
              Positioned(child: Row(children: [
                Text(date, style: TextStyle(fontSize: 13, color: Colors.white60),),
                const SizedBox(
                  width: 5,
                ),
                const Icon(
                  Icons.done_all,
                  size: 20,
                  color: Colors.white60,
                ),
              ],))
            ],
          ),
        ),
      ),
    );
  }
}

