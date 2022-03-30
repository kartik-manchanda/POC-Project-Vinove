import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:v6001_prashant_saxena/constants/color.dart';
import 'package:v6001_prashant_saxena/modules/contacts/screen_editContact.dart';

import 'database/contacts_database.dart';
import 'model/contact.dart';

class ContactDetailScreen extends StatefulWidget {
  final int contactId;

  const ContactDetailScreen({
    Key? key,
    required this.contactId,
  }) : super(key: key);

  @override
  _ContactDetailScreenState createState() => _ContactDetailScreenState();
}

class _ContactDetailScreenState extends State<ContactDetailScreen> {
  late Contact contact;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    refreshNote();
  }

  Future refreshNote() async {
    setState(() => isLoading = true);

    // this.note = await NotesDatabase.instance.readNote(widget.noteId);
    contact = (await ContactsDatabase.instance.readContact(widget.contactId))!;

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Edit Contact'),
          backgroundColor: appBarColor,
          actions: [editButton(), deleteButton()],
        ),
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.all(12),
                child: ListView(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  children: [
                    Text(
                      contact.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      DateFormat.yMMMd().format(contact.createdTime),
                      style: const TextStyle(color: Colors.white38),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      contact.description,
                      style:
                          const TextStyle(color: Colors.white70, fontSize: 18),
                    )
                  ],
                ),
              ),
      );

  Widget editButton() => IconButton(
      icon: const Icon(Icons.edit_outlined),
      onPressed: () async {
        if (isLoading) return;

        await Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AddEditContactScreen(contact: contact),
        ));

        refreshNote();
      });

  Widget deleteButton() => IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () async {
          await ContactsDatabase.instance.delete(widget.contactId);

          Navigator.of(context).pop();
        },
      );
}
