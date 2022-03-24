import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:v6001_prashant_saxena/constants/color.dart';

import 'otp_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  TextEditingController _codeController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  List<String> dropdown = ["INDIA", "USA", "RUSSIA", "UKRAINE"];
  var valued;
  String tphone = "";

  FirebaseAuth auth = FirebaseAuth.instance;

  String verificationID = "";

  loginWithPhone() async {
    print('LogInNum"${_codeController.text + _phoneController.text}"');
    auth.verifyPhoneNumber(
      phoneNumber: "${_codeController.text + _phoneController.text}",
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential).then((value) {
          print("You are logged in successfully");
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e.message);
      },
      codeSent: (String verificationId, int? resendToken) {
        // otpVisibility = true;
        verificationID = verificationId;
        setState(() {});
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
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
        title: Text("Enter your phone number",
            style: TextStyle(color: tabColor)),
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                        children: [
                          TextSpan(
                              text:
                              "WhatsApp will need to verify your phone number. "),
                          TextSpan(
                              text: "What's my number ?",
                              style: TextStyle(color: Colors.blue[700])),
                        ]),
                  ),
                  Container(
                    width: size.width * 0.6,
                    child: DropdownButton<String>(
                      underline: Container(
                        height: 2,
                        color: tabColor,
                      ),
                      hint: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("India"),
                        ),
                      ),
                      value: valued,
                      isExpanded: true,
                      items: dropdown.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Center(
                            child: Text(
                              value,
                              style: TextStyle(color: Colors.black54),
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          valued = value;
                        });
                      },
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: size.width * 0.1,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: _codeController,
                            decoration: InputDecoration(
                              hintText: "+91",
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.teal),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.teal),
                              ),
                            ),
                            onSubmitted: (code) {
                              setState(() {
                                tphone = tphone + code;
                              });
                            },
                          ),
                        ),
                        SizedBox(

                          width: size.width * 0.1,
                        ),
                        Container(
                          width: size.width * 0.4,
                          child: TextField(
                              keyboardType: TextInputType.number,
                              controller: _phoneController,
                              decoration: const InputDecoration(
                                hintText: "phone number",
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.teal),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.teal),
                                ),
                              ),
                              onSubmitted: (phone)
                              {
                                setState(() {
                                  tphone = tphone + phone;
                                });
                              },
                              onChanged: (phone)
                                  {
                              setState(() {
                                tphone = tphone + phone;
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: size.height*0.02,),

                  Text("Carrier charges may apply", style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),),

                ],
              ),

              Align(
                alignment: Alignment.bottomCenter,
                child:
                ElevatedButton(
                  child: Text('Next'),
                  onPressed: () async {
                    print("Next OTP$tphone");
                    await loginWithPhone();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => OtpPage(
                          verificationID: verificationID,
                        )));
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.teal,
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      textStyle:
                      TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                ),
              )



            ],
          ),
        ),
      ),
    );
  }
}
