import 'package:flutter/material.dart';
import 'package:quickbreak/components/reminder_item.dart';
import 'package:quickbreak/models/reminder_model.dart';

class ReminderList extends StatelessWidget{

  ReminderList(reminders);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var reminders;
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: reminders.length,
        itemBuilder: (context, index) {
          return ReminderItem(
            model: reminders[index],
            onDelete: (ReminderModel model){},
          );
        },
    );
  }
}