import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:quickbreak/components/custom_snack_bar_content.dart';
import 'package:quickbreak/constants.dart';
import 'package:quickbreak/service/api_service_users.dart';
import 'package:quickbreak/components/rounded_button.dart';
import 'package:quickbreak/models/user_model.dart';
import 'package:quickbreak/screens/Login/components/background.dart';
import 'package:quickbreak/components/rounded_input_field.dart';
import 'package:quickbreak/components/rounded_password_field.dart';
import 'package:quickbreak/components/already_have_an_account_check.dart';
import 'package:quickbreak/screens/MainScreen/main_screen.dart';
import 'package:quickbreak/screens/SignUp/signup_screen.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserModel userModel = UserModel();
    TextEditingController emailTextController = TextEditingController();
    TextEditingController passwordTextController = TextEditingController();
    Size size = MediaQuery
        .of(context)
        .size;
    return Background(
      child: SingleChildScrollView(
        reverse: true,
          padding: EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Login",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Image.asset(
                "assets/images/login.png",
                height: size.height * 0.35,
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              RoundedInputField(
                hintText: "Your Email",
                onChanged: (value) {},
                controller: emailTextController,
              ),
              RoundedPasswordField(
                onChanged: (value) {},
                controller: passwordTextController,
              ),
              RoundedButton(
                text: "Login",
                press: () async {
                  if(emailTextController.text.isNotEmpty && passwordTextController.text.isNotEmpty){
                    bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(emailTextController.text);
                    if(emailValid){
                      userModel.userEmail = emailTextController.text;
                      userModel.userPassword = passwordTextController.text;
                      String? id = await APIServiceUsers.login(userModel!);
                      if(id!= ""){
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: CustomSnackBarContent(titleText: "Success!", errorText: "Welcome!", colorBar: kPrimaryColor, image: "dog.png",),
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                        ));
                        Navigator.pushAndRemoveUntil(context,
                            MaterialPageRoute(builder: (context) => MainScreen(id: id,)), (Route<dynamic> route) => false);
                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: CustomSnackBarContent(titleText: "Oh snap!", errorText: "Invalid credentials!", colorBar: kSecondaryColor, image: "death.png",),
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                        ));
                      }
                    }else{
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: CustomSnackBarContent(titleText: "Oh snap!", errorText: "Enter a valid email!", colorBar: kSecondaryColor, image: "death.png",),
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                      ));
                    }
                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: CustomSnackBarContent(titleText: "Oh snap!", errorText: "Fill all the fields!", colorBar: kSecondaryColor, image: "death.png",),
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                    ));
                  }
                },
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              AlreadyHaveAnAccountCheck(
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SignUpScreen();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
      )
    );
  }
}












