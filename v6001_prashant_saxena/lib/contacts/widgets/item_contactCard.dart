import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:v6001_prashant_saxena/constants/color.dart';

import '../../constants/localisation/strings.dart';
import '../../widgets/item_settingOption.dart';
import '../model/contact.dart';

final _lightColors = [
  backgroundColor,
  backgroundColor,
];

class ContactCardWidget extends StatelessWidget {
  ContactCardWidget({
    Key? key,
    required this.note,
    required this.index,
  }) : super(key: key);

  final Contact note;
  final int index;

  @override
  Widget build(BuildContext context) {
    /// Pick colors from the accent colors based on index
    final color = _lightColors[index % _lightColors.length];
    final time = DateFormat.yMMMd().format(note.createdTime);
    // final minHeight = getMinHeight(index);

    return Card(
      elevation: 0,
      color: color,
      child: Container(
        height: 50,
        // constraints: BoxConstraints(minHeight: minHeight),
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text(
            //   time,
            //   style: TextStyle(color: backgroundColor),
            // ),
            SizedBox(height: 4),
            Text(
              note.title,
              style: TextStyle(

                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
  /// To return different height for different widgets
//   double getMinHeight(int index) {
//     switch (index % 4) {
//       case 0:
//         return 100;
//       case 1:
//         return 100;
//       case 2:
//         return 100;
//       case 3:
//         return 100;
//       default:
//         return 100;
//     }
//   }
// }