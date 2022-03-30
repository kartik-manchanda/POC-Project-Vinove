import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kartik_manchanda_v6016/Screens/user_name.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OtpScreen extends StatefulWidget {
  final String verificationID;
  const OtpScreen({Key? key, required this.verificationID}) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {

  List chats = [
    {"title": "Resend SMS", "image": Icon(Icons.chat,size: 20,), "trailing": "01:00"},
    {"title": "Call me  ", "image": Icon(Icons.call,size: 20,), "trailing": "01:00"},
  ];
  String otp = "";
  FirebaseAuth auth = FirebaseAuth.instance ;

  OtpFieldController otpController = OtpFieldController();

  Future<void> verifyOTP(String otp) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();





    print("verificationId=${widget.verificationID}");
    print("smsotp=$otp");
    PhoneAuthCredential credential =PhoneAuthProvider.credential(
        verificationId: widget.verificationID, smsCode: otp);



    await auth.signInWithCredential(credential).then((value) {
       prefs.setInt("initScreen", 1);
      print("You are logged in successfully");
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
        backgroundColor: Colors.white,
        title: Text(
          "verifying your number",
          style: TextStyle(color: Colors.teal),
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.more_vert,
              color: Colors.teal,
            ),
            onPressed: () {
              // do something
            },
          )
        ],
      ),
      body: SafeArea(
        child: Column(children: [
          Text(
            "waiting to automatically detect SMS sent to ",
          ),
          Text(
            "Wrong number ?",
            style: TextStyle(color: Colors.blue[700]),
          ),
          OTPTextField(
              controller: otpController,
              length: 6,
              width: MediaQuery.of(context).size.width * 0.5,
              textFieldAlignment: MainAxisAlignment.spaceEvenly,
              fieldWidth: 10,
              fieldStyle: FieldStyle.underline,
              outlineBorderRadius: 15,
              style: TextStyle(fontSize: 17, color: Colors.blueGrey),
              onChanged: (pin) {
                setState(() {
                  otp = pin;


                });
              },
              onCompleted: (pin) {
                setState(() {
                  otp = pin;
                });
              }),
          SizedBox(
            height: 10,
          ),
          Text(
            'Enter 6-digit Code',
            style: TextStyle(color: Colors.grey[700]),
          ),
          ListView.separated(
            shrinkWrap: true,
            itemCount: chats.length,
            itemBuilder: (context, index) => ListTile(
              onTap: () {},
              title: Text(
                chats[index]["title"],
                style: TextStyle(color: Colors.grey[700], fontSize: 12),
              ),
              leading: (chats[index]["image"]),
              trailing: Text(
                chats[index]["trailing"],
                style: TextStyle(color: Colors.grey[700],fontSize: 12),
              ),
            ), separatorBuilder: (BuildContext context, int index) {
              return Divider(color: Colors.grey,);
          },
          ),
          ElevatedButton(
            child: Text('submit'),
            onPressed: () async {
              print("kartik$otp");
              await verifyOTP(otp);
              Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => UserName()));
            },
            style: ElevatedButton.styleFrom(
                primary: Colors.teal,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                textStyle:
                    TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
          ),
        ]),
      ),
    );
  }
}
