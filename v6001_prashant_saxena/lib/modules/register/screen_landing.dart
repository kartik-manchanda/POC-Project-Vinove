import 'package:flutter/material.dart';
import 'package:v6001_prashant_saxena/constants/color.dart';
import 'package:v6001_prashant_saxena/modules/register/register_page.dart';
import 'package:v6001_prashant_saxena/widgets/item_elevatedbutton.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 50,),
              Text('Welcome to WhatsApp', style: TextStyle(
                color: tabColor,
                fontSize: 30,
                fontWeight: FontWeight.w500
              ),),
              SizedBox(
                height: MediaQuery.of(context).size.height/5,
              ),
              Image.asset('assets/landing.png', color: messageColor, scale: 3,),
              SizedBox(
                height: MediaQuery.of(context).size.height/5,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14
                    ),
                  children: [
                    TextSpan(
                      text: "Read our",
                      style: TextStyle(
                        color: Colors.grey
                      )),
                    TextSpan(
                        text: "Privacy Policy",
                        style: TextStyle(
                            color: Colors.blueAccent
                        )),
                    TextSpan(
                        text: "Tap `Agree and Continue` to accept the",
                        style: TextStyle(
                            color: Colors.grey
                        )),
                    TextSpan(
                        text: "Terms of Service",
                        style: TextStyle(
                            color: Colors.blueAccent
                        )),
                  ]
                ),),
              ),
              SizedBox(height: 15,),
              MyElevatedButton(
                onPressed: (){
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const RegisterPage(),),);
                },
                child: Text('AGREE AND CONTINUE'), )
            ],
          ),
        ),
      ),
    );
  }
}
