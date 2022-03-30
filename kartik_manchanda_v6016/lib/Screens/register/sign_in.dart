import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kartik_manchanda_v6016/Constants/colors.dart';
import 'package:kartik_manchanda_v6016/Screens/register/otp_screen.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController _codeController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  List<String> dropdown = ["INDIA", "USA", "RUSSIA", "UKRAINE"];
  var valued;
  String tphone = "";

  FirebaseAuth auth = FirebaseAuth.instance;

  String verificationID = "";

  loginWithPhone() async {
    print('kart"${tphone}"');
    auth.verifyPhoneNumber(
      phoneNumber:tphone,
      // phoneNumber: "${_codeController.text + _phoneController.text}",
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
        print("signinverificationID$verificationID");
        setState(() {});
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Enter your phone numberr",
            style: TextStyle(color: Colors.teal)),
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
                            color: Colors.grey[800],
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
                        color: ColorConstants.teal_green_light,
                      ),
                      hint: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("country"),
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
                            keyboardType: TextInputType.text,
                            controller: _codeController,
                            decoration: InputDecoration(
                              hintText: "code",
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
                              hintText: "Mobile Number",
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.teal),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.teal),
                              ),
                            ),
                            onSubmitted: (phone) {
                              setState(() {
                                tphone = tphone + phone;
                              });
                            },
                            // onChanged: (phone) {
                            //   setState(() {
                            //     tphone = tphone + phone;
                            //   });
                            // },
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: size.height*0.02,),

                  Text("Carrier charges may apply", style: TextStyle(
                      color: Colors.grey[800],
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
                    print("aditya$tphone");
                    await loginWithPhone();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => OtpScreen(
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
