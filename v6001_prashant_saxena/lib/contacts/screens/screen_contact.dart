import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:v6001_prashant_saxena/constants/color.dart';
import 'package:v6001_prashant_saxena/contacts/screens/screen_editContact.dart';
import 'package:v6001_prashant_saxena/contacts/screens/screen_contactDetail.dart';

import '../../constants/localisation/strings.dart';
import '../../modules/settings/screen_invite.dart';
import '../database/contacts_database.dart';
import '../model/contact.dart';
import '../widgets/item_contactCard.dart';
class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  late List<Contact> notes;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshContacts();
  }

  @override
  void dispose() {
    ContactsDatabase.instance.close();
    super.dispose();
  }

  Future refreshContacts() async {
    setState(() => isLoading = true);

    notes = await ContactsDatabase.instance.readAllNotes();

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
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
      title: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.of(context)!.SelectContacts,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          Text(
            '10 Contacts',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
          ),
        ],
      ),
      backgroundColor: appBarColor,
      actions: [
        Icon(Icons.search, color: Colors.white,),
        PopupMenuButton(
            onSelected: (result){
              if(result == 1){
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const InvitePage(),
                  ),
                );
              }
              else if(result == 2){
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const InvitePage(),
                  ),
                );
              }
              else if(result == 2){
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const InvitePage(),
                  ),
                );
              }
              else {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const InvitePage(),
                  ),
                );
              }
            },
            color: appBarColor,
            icon: Icon(Icons.more_vert),
            itemBuilder: (context) => [
              PopupMenuItem(child: Text(Strings.of(context)!.InviteFriend), value: 1,),
              PopupMenuItem(child: Text(Strings.of(context)!.Contacts), value: 2,),
              PopupMenuItem(child: Text(Strings.of(context)!.Refresh), value: 3,),
              PopupMenuItem(child: Text(Strings.of(context)!.Help), value: 4,),
            ]
        )
      ],
    ),
    body:
    Center(
      child: isLoading
          ? const CircularProgressIndicator()
          : notes.isEmpty
          ? const Text(
        'No Contacts',
        style: TextStyle(color: Colors.grey, fontSize: 20),
      )
          : buildNotes(),
    ),
    floatingActionButton: FloatingActionButton(
      backgroundColor: tabColor,
      child: const Icon(Icons.add, color: Colors.white,),
      onPressed: () async {
        await Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const AddEditContactScreen()),
        );

        refreshContacts();
      },
    ),
  );

  Widget buildNotes() => StaggeredGridView.countBuilder(
    padding: const EdgeInsets.all(8),
    itemCount: notes.length,
    staggeredTileBuilder: (index) => const StaggeredTile.fit(4),
    crossAxisCount: 4,
    mainAxisSpacing: 4,
    crossAxisSpacing: 4,
    itemBuilder: (context, index) {
      final note = notes[index];

      return GestureDetector(
        onTap: () async {
          await Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ContactDetailScreen(contactId: note.id!),
          ));

          refreshContacts();
        },
        child: ContactCardWidget(note: note, index: index),
      );
    },
  );
}