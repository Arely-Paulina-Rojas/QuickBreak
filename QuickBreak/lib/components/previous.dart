import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quickbreak/screens/MainScreen/main_screen.dart';

class Previous extends StatelessWidget{
  final String id;
  const Previous({
    Key? key,
    required this.id
}) : super(key: key);

  @override
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.zero,
      child: Row(
        children: <Widget>[
          IconButton(
            iconSize: 1,
            onPressed: (){
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => MainScreen(id: id)), (Route<dynamic> route) => false);
          }, icon: SvgPicture.asset("assets/icons/arrow.svg"), color: Colors.white,)
        ],
      ),
    );
  }

}