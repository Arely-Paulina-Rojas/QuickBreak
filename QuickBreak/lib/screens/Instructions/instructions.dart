import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:quickbreak/constants.dart';
import 'package:quickbreak/screens/MainScreen/main_screen.dart';



class Instructions extends StatelessWidget {
  final String? id;
  Instructions({Key? key, required this.id}): super(key: key);

  static const TextStyle quickbreakGreyStyle = TextStyle(
    color: Colors.grey,
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    fontFamily: "Product Sans"
  );

  static const TextStyle quickbreakWhiteStyle = TextStyle(
      color: Colors.white,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      fontFamily: "Product Sans"
  );

  static const TextStyle greyStyle = TextStyle(
    fontSize: 40.0,
    color: Colors.grey,
    fontFamily: "Product Sans"
  );

  static const TextStyle whiteStyle = TextStyle(
      fontSize: 40.0,
      color: Colors.white,
      fontFamily: "Product Sans"
  );

  static const TextStyle boldStyle = TextStyle(
      fontSize: 50.0,
      color: kPrimaryColor,
      fontFamily: "Product Sans",
      fontWeight: FontWeight.bold
  );

  static const TextStyle boldBlackStyle = TextStyle(
      fontSize: 50.0,
      color: kPrimaryLightColor,
      fontFamily: "Product Sans",
      fontWeight: FontWeight.bold
  );

  static const TextStyle descriptionGreyStyle = TextStyle(
    color: Colors.grey,
    fontSize: 20.0,
    fontFamily: "Product Sans"
  );

  static const TextStyle descriptionWhiteStyle = TextStyle(
      color: Colors.white,
      fontSize: 20.0,
      fontFamily: "Product Sans"
  );

  @override
  Widget build(BuildContext context) {

    final pages = [
      Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("quickBreak",
                    style: quickbreakGreyStyle,),
                  FlatButton(
                    color: Colors.white,
                    onPressed:(){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return MainScreen(id: id);
                          },
                        ),
                      );
                    },
                    child: Text(
                      "exit",
                      style: quickbreakGreyStyle,
                    ),
                  ),
                ],
              ),
            ),
            Image.asset("assets/images/firstImage.png"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Save",
                    style: greyStyle,),
                  Text("Reminders",
                    style: boldStyle,),
                  SizedBox(height: 20.0,),
                  Text("To take your eyes off\n"
                      "the screen for a \n"
                      "moment when playing",
                    style: descriptionGreyStyle,)
                ],
              ),
            ),
          ],
        ),
      ),
      Container(
        color: kPrimaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("quickBreak",
                    style: quickbreakWhiteStyle,),
                  FlatButton(
                    color: kPrimaryColor,
                    onPressed:(){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return MainScreen(id: id);
                          },
                        ),
                      );
                    },
                    child: Text(
                      "exit",
                      style: quickbreakWhiteStyle,
                    ),
                  ),
                ],
              ),
            ),
            Image.asset("assets/images/secondImage.png"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Start",
                    style: whiteStyle,),
                  Text("Reminders",
                    style: boldBlackStyle,),
                  SizedBox(height: 20.0,),
                  Text("Start the countdown\n"
                      "with the the purple\n"
                      "'Start' button",
                    style: descriptionWhiteStyle,)
                ],
              ),
            ),
          ],
        ),
      ),
      Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("quickBreak",
                    style: quickbreakGreyStyle,),
                  FlatButton(
                    color: Colors.white,
                    onPressed:(){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return MainScreen(id: id);
                          },
                        ),
                      );
                    },
                    child: Text(
                      "exit",
                      style: quickbreakGreyStyle,
                    ),
                  ),
                ],
              ),
            ),
            Image.asset("assets/images/game-on.png"),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Name your",
                    style: greyStyle,),
                  Text("Reminders",
                    style: boldStyle,),
                  SizedBox(height: 20.0,),
                  Text("You can put the \n"
                      "name of your game \n"
                      "to the reminder",
                    style: descriptionGreyStyle,)
                ],
              ),
            ),
          ],
        ),
      ),
      Container(
        color: kPrimaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("quickBreak",
                    style: quickbreakWhiteStyle,),
                  FlatButton(
                    color: kPrimaryColor,
                    onPressed:(){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return MainScreen(id: id);
                          },
                        ),
                      );
                    },
                    child: Text(
                      "exit",
                      style: quickbreakWhiteStyle,
                    ),
                  ),
                ],
              ),
            ),
            Image.asset("assets/images/videogame.png"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Set a game",
                    style: whiteStyle,),
                  Text("Time",
                    style: boldBlackStyle,),
                  SizedBox(height: 20.0,),
                  Text("You must set a game\n"
                      "time, the recommended\n"
                      "is 20 minutes",
                    style: descriptionWhiteStyle,)
                ],
              ),
            ),
          ],
        ),
      ),
      Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("quickBreak",
                    style: quickbreakGreyStyle,),
                  FlatButton(
                    color: Colors.white,
                    onPressed:(){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return MainScreen(id: id);
                          },
                        ),
                      );
                    },
                    child: Text(
                      "exit",
                      style: quickbreakGreyStyle,
                    ),
                  ),
                ],
              ),
            ),
            Image.asset("assets/images/break.png"),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Set a ",
                    style: greyStyle,),
                  Text("Break time",
                    style: boldStyle,),
                  SizedBox(height: 20.0,),
                  Text("You must set \n"
                      "a break time, minimum \n"
                      "is 10 minutes",
                    style: descriptionGreyStyle,)
                ],
              ),
            ),
          ],
        ),
      ),
      Container(
        color: kPrimaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("quickBreak",
                    style: quickbreakWhiteStyle,),
                  FlatButton(
                    color: kPrimaryColor,
                    onPressed:(){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return MainScreen(id: id);
                          },
                        ),
                      );
                    },
                    child: Text(
                      "exit",
                      style: quickbreakWhiteStyle,
                    ),
                  ),
                ],
              ),
            ),
            Image.asset("assets/images/activity.png"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Set an",
                    style: whiteStyle,),
                  Text("Activity",
                    style: boldBlackStyle,),
                  SizedBox(height: 20.0,),
                  Text("You can place any\n"
                      "activity to do during \n"
                      "your break",
                    style: descriptionWhiteStyle,)
                ],
              ),
            ),
          ],
        ),
      ),
    ];

    return Scaffold(
      body: LiquidSwipe(
        pages: pages,
        enableLoop: true,
        fullTransitionValue: 300,
        enableSideReveal: true,
        waveType: WaveType.liquidReveal,
        positionSlideIcon: 0.5,

      ),
    );
  }
}