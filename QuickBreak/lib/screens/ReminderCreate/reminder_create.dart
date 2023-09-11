import 'package:flutter/material.dart';
import 'package:quickbreak/screens/ReminderCreate/components/body.dart';

class ReminderCreate extends StatelessWidget {
  final String? id;
  ReminderCreate({Key? key, required this.id}): super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(
        child: Column(),
        id: id,
      ),
    );
  }
}