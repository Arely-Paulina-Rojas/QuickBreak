import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:quickbreak/components/custom_snack_bar_content.dart';
import 'package:quickbreak/components/previous.dart';
import 'package:quickbreak/components/rounded_button.dart';
import 'package:quickbreak/constants.dart';
import 'package:quickbreak/models/reminder_model.dart';

class ReminderTimerClock extends StatefulWidget{
  @override
  _TimerClockState createState() => _TimerClockState();
}

class _TimerClockState extends State<ReminderTimerClock>{
  ReminderModel? reminderModel;
  String id = "";
  double percent = 0.0;
  static int TimeInMinut = 0;
  final player = AudioPlayer();

  late Timer timer;

  @override
  void initState(){
    super.initState();
    reminderModel = ReminderModel();

    Future.delayed(Duration.zero, (){
      if(ModalRoute.of(context)?.settings.arguments != null){
        final Map arguments = ModalRoute.of(context)?.settings.arguments as Map;
        reminderModel = arguments['model'];
        id = arguments['id'];
        TimeInMinut = int.parse(reminderModel!.reminderTime ?? "");
        setState((){});
      }
    });
  }

  _StartTimer(int timeInMinut){
    percent = 0.0;
    TimeInMinut = timeInMinut;
    int Time = TimeInMinut * 60;
    double SecPercent = (Time/100);
    timer = Timer.periodic(Duration(seconds: 1), (timer){
      if(mounted){
        setState((){
          if(Time > 0){
            Time--;
            if(Time % 60 == 0){
              TimeInMinut--;
            }if(Time % SecPercent == 0){
              if(percent < 1){
                percent += 0.01;
              }else{
                percent = 1;
              }
            }
          }else{
            timer.cancel();
            percent = 0;
            TimeInMinut = timeInMinut;
            player.play(AssetSource('sounds/mother.mp3'));
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: CustomSnackBarContent(titleText: "Break time!", errorText: reminderModel!.reminderActivity ?? "", colorBar: kPrimaryColor, image: "dog.png",),
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.transparent,
              elevation: 0,
            ));
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context){
    String name = reminderModel!.reminderName ?? "";
    String screenTime = reminderModel!.reminderTime ?? "";
    String breakTime = reminderModel!.reminderBreakTime ?? "";

    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [kPrimaryLightColor, kPrimaryColor],
                  begin: FractionalOffset(0.5, 1)
              )
          ),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Previous(id: id),
              Padding(
                padding: EdgeInsets.only(top: 0.5),
                child: Text(
                  "$name",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0
                  ),
                ),
              ),
              Expanded(
                child: CircularPercentIndicator(
                  circularStrokeCap: CircularStrokeCap.round,
                  percent: percent,
                  animation: true,
                  animateFromLastPercent: true,
                  radius: 130.0,
                  lineWidth: 20.0,
                  progressColor: Colors.white,
                  center: Text(
                    "$TimeInMinut",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 70.0
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.0,),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topRight: Radius.circular(30.0), topLeft: Radius.circular(30.0))
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      "Play Time",
                                      style: TextStyle(
                                        fontSize: 25.0,
                                      ),
                                    ),
                                    SizedBox(height: 10.0,),
                                    Text(
                                      "$screenTime",
                                      style: TextStyle(
                                          fontSize: 50.0
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      "Pause Time",
                                      style: TextStyle(
                                        fontSize: 25.0,
                                      ),
                                    ),
                                    SizedBox(height: 10.0,),
                                    Text(
                                      "$breakTime",
                                      style: TextStyle(
                                          fontSize: 50.0
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 50.0),
                          child: RoundedButton(
                            text: "Start",
                            press: () {
                              _StartTimer(int.parse(screenTime));},
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}