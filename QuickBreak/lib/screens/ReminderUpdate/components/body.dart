import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:quickbreak/components/custom_snack_bar_content.dart';
import 'package:quickbreak/service/api_service.dart';
import 'package:quickbreak/components/rounded_button.dart';
import 'package:quickbreak/components/rounded_input_generic_field.dart';
import 'package:quickbreak/constants.dart';
import 'package:quickbreak/models/reminder_model.dart';
import 'package:quickbreak/screens/MainScreen/main_screen.dart';
import 'package:quickbreak/screens/ReminderUpdate/components/background.dart';
import 'package:local_auth/local_auth.dart';

class Body extends StatelessWidget {
  final Widget child;
  final ReminderModel? reminderModel;
  final String? id;
  const Body({
    Key? key,
    required this.child,
    required this.reminderModel,
    required this.id
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    LocalAuthentication _localAuth;
    bool _isBiometricAvaible = false;
    _localAuth = LocalAuthentication();
    _localAuth.canCheckBiometrics.then((b) {
      _isBiometricAvaible = b;
    });
    TextEditingController nameTextController = TextEditingController();
    TextEditingController timeTextController = TextEditingController();
    TextEditingController timeBreakTextController = TextEditingController();
    TextEditingController activityTextController = TextEditingController();
    Size size = MediaQuery.of(context).size;
    print(id);
    return Background(
      child: SingleChildScrollView(
        reverse: true,
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Update Reminder",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.05),
            RoundedInputGenericField(
              hintText: "Name",
              icon: Icons.gamepad,
              onChanged: (value) {},
              controller: nameTextController..text = reminderModel!.reminderName ?? "",
            ),
            RoundedInputGenericField(
              hintText: "Time",
              icon: Icons.access_alarm,
              onChanged: (value) {},
              controller: timeTextController..text = reminderModel!.reminderTime ?? "",
            ),
            RoundedInputGenericField(
              hintText: "Break",
              icon: Icons.free_breakfast,
              onChanged: (value) {},
              controller: timeBreakTextController..text = reminderModel!.reminderBreakTime ?? "",
            ),
            RoundedInputGenericField(
              hintText: "Activity",
              icon: Icons.directions_walk,
              onChanged: (value) {},
              controller: activityTextController..text = reminderModel!.reminderActivity ?? "",
            ),
            SizedBox(height: size.height * 0.03),
            RoundedButton(
              text: "Save",
              press: () async{
                if(nameTextController.text.isNotEmpty && timeTextController.text.isNotEmpty && timeBreakTextController.text.isNotEmpty && activityTextController.text.isNotEmpty){
                  bool timeValid = RegExp(r"^\d{2}?$").hasMatch(timeTextController.text);
                  bool breakValid = RegExp(r"^\d{2}?$").hasMatch(timeBreakTextController.text);
                  if(timeValid && breakValid){
                    reminderModel?.reminderName = nameTextController.text;
                    reminderModel?.reminderTime = timeTextController.text;
                    reminderModel?.reminderBreakTime = timeBreakTextController.text;
                    reminderModel?.reminderActivity = activityTextController.text;
                    bool success = false;
                    if(_isBiometricAvaible){
                      bool didAuthenticate = await _localAuth.authenticate(
                        localizedReason: "Please identify yourself!", options: const AuthenticationOptions(biometricOnly: true));
                      if(didAuthenticate){
                        success =  await APIService.saveReminder(reminderModel!, true);
                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: CustomSnackBarContent(titleText: "Oh snap!", errorText: "You need to identify yourself!", colorBar: kSecondaryColor, image: "death.png",),
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                        ));
                      }
                    }else{
                      success = await APIService.saveReminder(reminderModel!, true);
                    }
                    if(success){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: CustomSnackBarContent(titleText: "Success!", errorText: "Updated reminder!", colorBar: kPrimaryColor, image: "dog.png",),
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                      ));
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return MainScreen(id: id);
                          },
                        ),
                      );
                    }else{
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: CustomSnackBarContent(titleText: "Oh snap!", errorText: "Error updating reminder", colorBar: kSecondaryColor, image: "death.png",),
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                      ));
                    }
                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: CustomSnackBarContent(titleText: "Oh snap!", errorText: "Please enter a valid time and break time!", colorBar: kSecondaryColor, image: "death.png",),
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
            RoundedButton(
              text: "Cancel",
              color: kPrimaryLightColor,
              textColor: Colors.black,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return MainScreen(id: id);
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}