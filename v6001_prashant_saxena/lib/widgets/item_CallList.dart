import 'package:flutter/material.dart';

import '../constants/data.dart';
import '../modules/calls/call_info.dart';

class CallList extends StatelessWidget {
  const CallList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: calldata.length,
        itemBuilder: (context, index) {
          return
            Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const CallInfo(),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: ListTile(
                    title: Text(
                      calldata[index]['name'].toString(),
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 6.0),
                      child: Row(
                        children: [
                        Text(
                          calldata[index]['call'].toString(),
                          style: const TextStyle(fontSize: 15),
                        ),
                        Text(
                          calldata[index]['datetime'].toString(),
                          style: const TextStyle(fontSize: 15),
                        ),],
                      )
                    ),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                        calldata[index]['profilePic'].toString(),
                      ),
                      radius: 30,
                    ),
                    // trailing: Icon(calldata[index]['status'].toString()),

                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
