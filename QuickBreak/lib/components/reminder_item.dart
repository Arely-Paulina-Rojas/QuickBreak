import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:quickbreak/components/custom_snack_bar_content.dart';
import 'package:quickbreak/constants.dart';
import 'package:quickbreak/models/reminder_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quickbreak/screens/MainScreen/main_screen.dart';
import 'package:quickbreak/screens/ReminderUpdate/ReminderUpdate.dart';
import 'package:quickbreak/screens/timer_clock.dart';

class ReminderItem extends StatelessWidget{
  const ReminderItem({Key? key, this.model, this.id,this.onDelete}) : super(key: key);
  final ReminderModel? model;
  final String? id;
  final Function? onDelete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 7.0),
      child: Container(
        decoration: boxDecoration(),
        height: 100.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                iconClock(),
                infoReminderTexts(context),
              ],
            ),
            playIcon(context),
          ],
        ),
      ),
    );
  }

  BoxDecoration boxDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10.0),
      boxShadow: <BoxShadow>[
        BoxShadow(
          color: Colors.black26,
          offset: Offset(2.0, 2.0),
          blurRadius: 8.0,
        ),
      ],
    );
  }

  Widget iconClock() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Image.asset("assets/images/clock.png"),
    );
  }

  Widget infoReminderTexts(context) {
    LocalAuthentication _localAuth;
    bool _isBiometricAvaible = false;
    _localAuth = LocalAuthentication();
    _localAuth.canCheckBiometrics.then((b) {
      _isBiometricAvaible = b;
    });
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
         model!.reminderName?? "",
          style: Theme
              .of(context)
              .textTheme
              .subtitle1,
        ),
        Text(
          model!.reminderTime?? "",
          style: Theme
              .of(context)
              .textTheme
              .headline4,
        ),
        SizedBox(height: 3.0),
        Row(
          children: <Widget>[
            SizedBox(width: 3.0),
            Text(
              model!.reminderActivity?? "",
              style: TextStyle(
                fontSize: 14.0,
                color: Color(0xFF757575),
              ),
            )
          ],
        ),
        SizedBox(width: 3.0),
        Row(
          children: <Widget>[
            GestureDetector(
              child: const Icon(Icons.edit,
                color: kPrimaryColor,),
              onTap: (){
                //Navigator.of(context).pushNamed('/update-reminder', arguments: {'model': model});
                Navigator.push(context, MaterialPageRoute(builder: (context) => ReminderUpdate(reminderModel: model!, id: id,),));
              },
            ),
            GestureDetector(
              child: const Icon(Icons.delete,
                color: Colors.red,),
              onTap: () async {
                bool success = false;
                if(_isBiometricAvaible){
                  bool didAuthenticate = await _localAuth.authenticate(
                    localizedReason: "Please identify yourself!", options: AuthenticationOptions(biometricOnly: true));
                  if(didAuthenticate){
                    success = await onDelete!(model);
                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: CustomSnackBarContent(titleText: "Oh snap!", errorText: "You need to identify yourself!", colorBar: kSecondaryColor, image: "death.png",),
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                    ));
                  }
                }else{
                  success = await onDelete!(model);
                }
                if(success){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: CustomSnackBarContent(titleText: "Success!", errorText: "Removed Reminder!", colorBar: kPrimaryColor, image: "dog.png",),
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                  ));
                }else{
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: CustomSnackBarContent(titleText: "Oh snap!", errorText: "Error deleting reminder!", colorBar: kSecondaryColor, image: "death.png",),
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                  ));
                }

              },
            )
          ],
        )
      ],
    );
  }

  Widget playIcon(context){
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, right: 20.0),
      child: IconButton(
        iconSize: 10.0,
        icon: SvgPicture.asset('assets/icons/play.svg'),
        onPressed: (){
          //Navigator.push(context, MaterialPageRoute(builder: (context) => TimerClock(reminderModel: model!),));
          Navigator.of(context).pushNamed(
            '/timer-clock',
            arguments: {
              'model': model, 'id': id
            },
          );
        },
      ),
    );
  }
}