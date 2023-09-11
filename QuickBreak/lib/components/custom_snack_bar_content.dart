import 'package:flutter/material.dart';

import '../constants.dart';

class CustomSnackBarContent extends StatelessWidget {
  const CustomSnackBarContent({
    Key? key,
    required this.titleText,
    required this.errorText,
    required this.colorBar,
    required this.image
}) : super(key: key);
  final String errorText;
  final String titleText;
  final colorBar;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.all(16),
          height: 90,
          decoration: BoxDecoration(
            color: colorBar,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Row(
            children: [
              const SizedBox(width: 65),
              Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(titleText,
                        style: TextStyle(fontSize: 18, color: Colors.white),),
                      const Spacer(),
                      Text(errorText,
                        style: TextStyle(fontSize: 12, color: Colors.white),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,),
                    ],
                  )
              )
            ],
          ),
        ),
        Image.asset("assets/images/" + image, height: 88, width: 80,)
      ],
    );
  }
}