import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Constants/colors.dart';
import '../../database/database_helper_users.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({Key? key}) : super(key: key);

  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  List<Contact>? contacts;
  List<Map<String, dynamic>> rows = [];
  bool isLoad = false;
  @override
  void initState() {
    super.initState();

    setState(() {
      isLoad = true;
    });


    getContact();
    fetchData();
    setState(() {
      isLoad = false;
    });


    // insertContactsindB();
  }

  void getContact() async {
    if (await FlutterContacts.requestPermission()) {
      contacts = await FlutterContacts.getContacts(
          withProperties: true, withPhoto: true);
      print(contacts);

      int length = contacts!.length;
      print("1");
      for(int i=0; i<length ;i++){
        rows.forEach((element) async{
        if(  contacts![i].phones.contains(element['Phone'])){
          return;
        }
        else{
          await DataBaseHelperClass.instance.insert({
            DataBaseHelperClass.columnName: contacts![i].name.first,
            // DataBaseHelperClass.columnDate: _dateController.text,
            DataBaseHelperClass.columnPhone: contacts![i].phones.first.number,
          });
        }
      });
            }
      setState(() {

      });
    }
  }


  fetchData() async {
    print("ll");
    rows = await (DataBaseHelperClass.instance.queryAll());
    rows.toSet().toList();
    print("merabhai$rows");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            fetchData();
          },
        ),
        appBar: AppBar(
          title: const Text(
            "Contacts",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: ColorConstants.teal_green,
          elevation: 0,
        ),
        body: isLoad
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: rows.length,
                itemBuilder: (BuildContext context, int index) {
                  String num = (rows[index]['Phone'].isNotEmpty)
                      ? (rows[index]['Phone'])
                      : "--";
                  return ListTile(
                      leading: const CircleAvatar(child: Icon(Icons.person)),
                      title: Text("${rows[index]['Name']} "),
                      subtitle: Text(num),
                      onTap: () {
                        if (rows[index]['Phone'].isNotEmpty) {
                          launch('tel: ${num}');
                        }
                      });
                },
              )
        // ),
        // body: (contacts) == null
        //     ? Center(child: CircularProgressIndicator())
        //     : ListView.builder(
        //         itemCount: contacts!.length,
        //         itemBuilder: (BuildContext context, int index) {
        //           Uint8List? image = contacts![index].photo;
        //           String num = (contacts![index].phones.isNotEmpty)
        //               ? (contacts![index].phones.first.number)
        //               : "--";
        //           return ListTile(
        //               leading: (contacts![index].photo == null)
        //                   ? const CircleAvatar(child: Icon(Icons.person))
        //                   : CircleAvatar(backgroundImage: MemoryImage(image!)),
        //               title: Text(
        //                   "${contacts![index].name.first} ${contacts![index].name.last}"),
        //               subtitle: Text(num),
        //               onTap: () {
        //                 if (contacts![index].phones.isNotEmpty) {
        //                   launch('tel: ${num}');
        //                 }
        //               });
        //         },
        //       )

        );
  }
}



// Begin
// If not exists(select * from <tablename>
// where col1=value
// and col2 =value
// and col3=value)
// begin
// insert into <tablename>(col1,col2,col3)
// values(value1,value2,value3)
// end
// end
