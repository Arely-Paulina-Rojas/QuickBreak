import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:quickbreak/components/custom_snack_bar_content.dart';
import 'package:quickbreak/components/rounded_button.dart';
import 'package:quickbreak/screens/Login/login_screen.dart';
import 'package:quickbreak/screens/SignUp/signup_screen.dart';
import 'package:quickbreak/screens/welcome/componets/background.dart';

import '../../../constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Welcome to QuickBreak",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            Image.asset("assets/images/games.png",
              height: size.height * 0.45,
            ),
            SizedBox(height: size.height * 0.05),
            RoundedButton(
              text: "Login",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                      },
                   ),
                  );
                },
              ),
            RoundedButton(
              text: "Sign Up",
              color: kPrimaryLightColor,
              textColor: Colors.black,
              press: () {
                Navigator.push(
                  context,
                MaterialPageRoute(
                  builder: (context) {
                    return SignUpScreen();
                  },
                ),
              );},
            ),
          ],
        ),
      ),
    );
  }
}





