import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:v6001_prashant_saxena/screens/mobile_home.dart';
import 'package:v6001_prashant_saxena/widgets/item_elevatedbutton.dart';

import '../../../constants/color.dart';

class UserName extends StatelessWidget {
  UserName({Key? key}) : super(key: key);
  var _text = TextEditingController();
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  void createUserInFirestore() {
    users
        .where('uid', isEqualTo: FirebaseAuth.instance.currentUser?.uid)
        .limit(1)
        .get()
        .then(
      (QuerySnapshot querySnapshot) {
        if (querySnapshot.docs.isEmpty) {
          users.add({
            'name': _text.text,
            'phone': FirebaseAuth.instance.currentUser?.phoneNumber,
            'status': 'Available',
            'uid': FirebaseAuth.instance.currentUser?.uid
          });
        }
      },
    ).catchError((error) {});
  }

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: backgroundColor,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            CupertinoIcons.back,
            color: Colors.grey,
          ),
        ),
        title: Text(
          "Profile info",
          style: TextStyle(color: tabColor),
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.more_vert,
              color: Colors.grey,
            ),
            onPressed: () {
              // do something
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox( height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Please provide your name and an optional profile photo", style: TextStyle(color: Colors.grey),),
                  Image.asset('assets/camera.png', scale: 8, color: Colors.grey,),
                  Container(
                    width: size.width * 0.8,
                    child: TextField(
                      keyboardType: TextInputType.name,
                      autofillHints: <String>[AutofillHints.name],
                      controller: _text,
                      decoration: const InputDecoration(
                        hintText: "Your Name (not an username)",
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
                        suffixIcon: Icon(Icons.emoji_emotions, color: Colors.grey,),
                        suffixIconColor: Colors.grey,
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            MyElevatedButton(
                onPressed: () {
                  FirebaseAuth.instance.currentUser
                      ?.updateProfile(displayName: _text.text);

                  createUserInFirestore();

                  Navigator.push(context,
                      CupertinoPageRoute(builder: (context) => MobileHome()));
                },
                child: Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}
