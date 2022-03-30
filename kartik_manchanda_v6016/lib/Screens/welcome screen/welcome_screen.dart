import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kartik_manchanda_v6016/Constants/colors.dart';
import 'package:kartik_manchanda_v6016/Screens/register/otp_screen.dart';
import 'package:kartik_manchanda_v6016/main_screen.dart';

import '../register/sign_in.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding:
            const EdgeInsets.only(top: 50.0, bottom: 30, left: 10, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Welcome to WhatsApp",
              style: TextStyle(
                  fontSize: 32.0,
                  color: Colors.teal,
                  fontWeight: FontWeight.w600),
            ),
            CircleAvatar(
              radius: 100.0,
              backgroundImage: AssetImage('assets/images/welcome_doodle.jpg',),
              backgroundColor: Colors.white,
            ),
            Container(
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RichText(
                    text: TextSpan(
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 12,
                            fontWeight: FontWeight.w800),
                        children: [
                          TextSpan(text: "Read our"),
                          TextSpan(
                              text: "privacy policy.",
                              style: TextStyle(color: Colors.blue[700])),
                          TextSpan(
                              text:
                                  "Tap to \"Agree and continue\" to accepts the"),
                          WidgetSpan(
                              alignment: PlaceholderAlignment.middle,
                              style: TextStyle(color: Colors.blue[700]),
                              child: Center(
                                child: Text(
                                  "\nTerms of Service.",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.blue[700],
                                      fontSize: 12,
                                      fontWeight: FontWeight.w800),
                                ),
                              )),
                        ]),
                  ),
                ),
                Container(
                  width: size.width * 0.6,
                  child: ElevatedButton(
                    child: Text('Agree and Continue'),
                    onPressed: () {
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (context) => MainScreen()));
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SignInPage()));
                    },
                    style: ElevatedButton.styleFrom(
                        primary: ColorConstants.teal_green,
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        textStyle: TextStyle(
                            fontSize: 10, fontWeight: FontWeight.bold)),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    ));
  }
}
