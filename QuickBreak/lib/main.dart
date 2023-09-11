import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quickbreak/constants.dart';
import 'package:quickbreak/screens/Instructions/instructions.dart';
import 'package:quickbreak/screens/timer_clock.dart';
import 'package:quickbreak/screens/welcome/welcome_screen.dart';

import 'screens/reminder_timer_clock.dart';

void main() {
  ErrorWidget.builder = (FlutterErrorDetails details) => Scaffold(
    body: Center(
      child:
      Text("Break Time!",
      style: TextStyle(color: kPrimaryColor, fontSize: 30),
      ),
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
  .then((_) {
    runApp(MyApp());
  });

}

class MyApp extends  StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QuickBreak',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(
          headline4: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
            color: kPrimaryColor,
          ),
        )
      ),
        routes: {
          '/timer-clock': (context) => ReminderTimerClock(),
          '/main-timer-clock': (context) => TimerClock()
        },
      home: WelcomeScreen()
    );
  }
}



