import 'package:flutter/material.dart';
import 'package:quickbreak/models/reminder_model.dart';
import 'package:quickbreak/screens/ReminderUpdate/components/body.dart';

class ReminderUpdate extends StatelessWidget {
  final ReminderModel? reminderModel;
  final String? id;
  ReminderUpdate({Key? key, required this.reminderModel, required this.id }): super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(
        reminderModel: reminderModel,
        id: id,
        child: Column(),
      ),
    );
  }
}