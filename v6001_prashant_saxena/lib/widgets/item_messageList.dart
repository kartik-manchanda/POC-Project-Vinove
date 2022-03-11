import 'package:flutter/material.dart';
import 'package:v6001_prashant_saxena/widgets/item_receiverCard.dart';
import 'package:v6001_prashant_saxena/widgets/item_senderCard.dart';

import '../constants/data.dart';

class MessageList extends StatelessWidget {
  const MessageList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      itemCount: chatdata.length,
      itemBuilder: (context, index) {
        if (chatdata[index]['me'] == true) {
          return Sendercard(
            message: chatdata[index]['text'].toString(),
            date: chatdata[index]['time'].toString(),
          );
        }
        return ReceiverCard(
          message: chatdata[index]['text'].toString(),
          date: chatdata[index]['time'].toString(),
        );
      },
    );
  }
}
