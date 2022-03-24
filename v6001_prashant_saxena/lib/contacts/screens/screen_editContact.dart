import 'package:flutter/material.dart';
import 'package:v6001_prashant_saxena/constants/color.dart';

import '../database/contacts_database.dart';
import '../model/contact.dart';
import '../widgets/item_contactForm.dart';

class AddEditContactScreen extends StatefulWidget {
  final Contact? contact;

  const AddEditContactScreen({
    Key? key,
    this.contact,
  }) : super(key: key);
  @override
  _AddEditContactScreenState createState() => _AddEditContactScreenState();
}

class _AddEditContactScreenState extends State<AddEditContactScreen> {
  final _formKey = GlobalKey<FormState>();
  late bool isImportant;
  late int number;
  late String title;
  late String description;

  @override
  void initState() {
    super.initState();

    isImportant = widget.contact?.isImportant ?? false;
    number = widget.contact?.number ?? 0;
    title = widget.contact?.title ?? '';
    description = widget.contact?.description ?? '';
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      backgroundColor: appBarColor,
      actions: [buildButton()],
    ),
    body: Form(
      key: _formKey,
      child: NoteFormWidget(
        isImportant: isImportant,
        number: number,
        title: title,
        description: description,
        onChangedImportant: (isImportant) =>
            setState(() => this.isImportant = isImportant),
        onChangedNumber: (number) => setState(() => this.number = number),
        onChangedTitle: (title) => setState(() => this.title = title),
        onChangedDescription: (description) =>
            setState(() => this.description = description),
      ),
    ),
  );

  Widget buildButton() {
    final isFormValid = title.isNotEmpty && description.isNotEmpty;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          onPrimary: Colors.white,
          primary: isFormValid ? null : backgroundColor,
        ),
        onPressed: addOrUpdateNote,
        child: const Text('Save'),
      ),
    );
  }

  void addOrUpdateNote() async {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      final isUpdating = widget.contact != null;

      if (isUpdating) {
        await updateContact();
      } else {
        await addContact();
      }

      Navigator.of(context).pop();
    }
  }

  Future updateContact() async {
    final note = widget.contact!.copy(
      isImportant: isImportant,
      number: number,
      title: title,
      description: description,
    );

    await ContactsDatabase.instance.update(note);
  }

  Future addContact() async {
    final note = Contact(
      title: title,
      isImportant: true,
      number: number,
      description: description,
      createdTime: DateTime.now(),
    );

    await ContactsDatabase.instance.create(note);
  }
}