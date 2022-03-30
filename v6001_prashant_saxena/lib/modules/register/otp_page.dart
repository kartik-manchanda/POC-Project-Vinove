import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:v6001_prashant_saxena/constants/color.dart';
import 'package:v6001_prashant_saxena/modules/chats/chat_fire/user_name.dart';
import 'package:v6001_prashant_saxena/screens/mobile_home.dart';

class OtpPage extends StatefulWidget {
  final String verificationID;
  const OtpPage({Key? key, required this.verificationID}) : super(key: key);

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  List chats = [
    {"title": "Resend SMS", "image": Icon(Icons.chat), "trailing": "01:00"},
    {"title": "Call me  ", "image": Icon(Icons.call), "trailing": "01:00"},
  ];
  String otp = "";
  FirebaseAuth auth = FirebaseAuth.instance;

  OtpFieldController otpController = OtpFieldController();

  Future<void> verifyOTP(String otp) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: widget.verificationID, smsCode: otp);

    await auth.signInWithCredential(credential).then((value) async{
      print("You are logged in successfully");
      await prefs.setInt("initScreen", 1);
      Fluttertoast.showToast(
          msg: "You are logged in successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    });
  }

  @override
  Widget build(BuildContext context) {
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
          "Verifying your number",
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
      body: SafeArea(
        child: Column(children: [
          SizedBox(
            height: 20,
          ),
          Text(
            "Waiting to automatically detect SMS sent to ",
          ),
          Text(
            "Wrong number ?",
            style: TextStyle(color: Colors.blue[700]),
          ),
          SizedBox(
            width: 200,
            child: OTPTextField(
                controller: otpController,
                length: 6,
                width: MediaQuery.of(context).size.width,
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldWidth: 20,
                fieldStyle: FieldStyle.underline,
                otpFieldStyle: OtpFieldStyle(borderColor: Colors.white),

                outlineBorderRadius: 15,
                style: TextStyle(fontSize: 17, color: messageColor),
                onChanged: (pin) {
                  setState(() {
                    otp = pin;

                    print("sUBMIT$otp");
                  });
                },
                onCompleted: (pin) {
                  setState(() {
                    otp = pin;
                  });
                }),
          ),
          SizedBox(
            height: 15,
          ),
          Text('Enter 6-digit Code'),
          ListView.separated(
            shrinkWrap: true,
            itemCount: chats.length,
            itemBuilder: (context, index) => ListTile(
              onTap: () {},
              title: Text(chats[index]["title"]),
              leading: (chats[index]["image"]),
              trailing: Text(
                chats[index]["trailing"],
              ),
            ),
            separatorBuilder: (BuildContext context, int index) {
              return Divider(
                endIndent: 5,
                indent: 5,
              );
            },
          ),
          ElevatedButton(
            child: Text('Submit'),
            onPressed: () async {
              print("otp check$otp");
              await verifyOTP(otp);
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => UserName()));
            },
            style: ElevatedButton.styleFrom(
                primary: tabColor,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                textStyle:
                    TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
          ),
        ]),
      ),
    );
  }
}
