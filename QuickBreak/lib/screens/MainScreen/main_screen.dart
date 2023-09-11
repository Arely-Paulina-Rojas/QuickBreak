import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quickbreak/components/custom_snack_bar_content.dart';
import 'package:quickbreak/constants.dart';
import 'package:quickbreak/screens/Instructions/instructions.dart';
import 'package:quickbreak/service/api_service.dart';
import 'package:quickbreak/components/reminder_item.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quickbreak/models/reminder_model.dart';
import 'package:quickbreak/screens/ReminderCreate/reminder_create.dart';
import 'package:quickbreak/screens/Welcome/welcome_screen.dart';


class MainScreen extends StatelessWidget{
  List<ReminderModel> reminders = List<ReminderModel>.empty(growable: true);
  final String? id;
  MainScreen({Key? key, required this.id}): super(key: key);
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: SafeArea(
        child: ListView(
          children: <Widget>[
            customAppBar(context),
            SizedBox(height: 20.0),
            loadReminders(),
            SizedBox(height: 50.0),
          ],
        ),
      ),
    );
  }

  Widget customAppBar(context){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            iconSize: 20.0,
            icon: SvgPicture.asset('assets/icons/power.svg'),
            onPressed: (){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: CustomSnackBarContent(titleText: "Success!", errorText: "Signed Out", colorBar: kPrimaryColor, image: "death.png",),
                behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.transparent,
                elevation: 0,
              ));
                Navigator.pushAndRemoveUntil(context,
                MaterialPageRoute(builder: (context) => WelcomeScreen()), (Route<dynamic> route) => false);
            },
          ),
          Row(children: <Widget>[
            IconButton(
              iconSize: 20.0,
              icon: SvgPicture.asset('assets/icons/info.svg'),
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Instructions(id: id);
                    },
                  ),
                );
              },
            ),
            IconButton(
              iconSize: 20.0,
              icon: SvgPicture.asset('assets/icons/clockMain.svg'),
              onPressed: (){
                Navigator.of(context).pushNamed(
                  '/main-timer-clock',
                  arguments: {
                    'id': id,
                  },
                );
              },
            ),
            IconButton(
              iconSize: 20.0,
              icon: SvgPicture.asset('assets/icons/plus.svg'),
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ReminderCreate(id: id,);
                    },
                  ),
                );
              },
            ),
          ],)
        ],
      ),
    );
  }

  Widget loadReminders(){
    return FutureBuilder(
        //future: APIService.getReminders(),
        future: APIService.getRemindersUser(id!),
        builder: (
            BuildContext context,
            AsyncSnapshot<List<ReminderModel>?> model,
        ) {
            if(model.hasData) {
              return listReminders(model.data);
            }
            return const Center(child: CircularProgressIndicator() ,);
        }
    );
  }

  Widget listReminders(reminders) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: reminders.length,
      itemBuilder: (context, index) {
        return ReminderItem(
          model: reminders[index],
          id: id,
          onDelete: (ReminderModel model){

            APIService.deleteReminder(model.id);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return MainScreen(id: id);
                },
              ),
            );
          },
        );
      },
    );
  }



}




