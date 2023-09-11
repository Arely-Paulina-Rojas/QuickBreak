import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quickbreak/service/config.dart';

import '../models/reminder_model.dart';

class APIService {
  static var client = http.Client();

  static Future<List<ReminderModel>?> getReminders() async{
    Map<String, String> requestHeaders = {'Content-Type': 'application/json', 'Access-Control-Allow-Origin': '*'};

    var url = Uri.http(Config.apiURL, Config.remindersAPI);

    var response = await client.get(url, headers: requestHeaders);

    if(response.statusCode == 200){
      var data = jsonDecode(response.body);

      return remindersFromJson(data["data"]);
    } else {
      return null;
    }
  }

  static Future<List<ReminderModel>?> getRemindersUser(String id) async{
    Map<String, String> requestHeaders = {'Content-Type': 'application/json', 'Access-Control-Allow-Origin': '*'};

    var url = Uri.http(Config.apiURL, Config.remindersAPI + "/user/" + id);
    var response = await client.get(url, headers: requestHeaders);

    if(response.statusCode == 200){
      var data = jsonDecode(response.body);
      return remindersFromJson(data["data"]);
    } else {
      return null;
    }
  }

  static Future<bool> saveReminder(
        ReminderModel model,
        bool isEditMode,
      ) async{

    var reminderURL = Config.remindersAPI;

    if(isEditMode){
      reminderURL = reminderURL + "/" + model.id.toString();
    }

    var url = Uri.http(Config.apiURL, reminderURL);

    var requestMethod = isEditMode ? "PUT" : "POST";

    var request = http.MultipartRequest(requestMethod, url);
    request.fields["reminderName"] = model.reminderName!;
    request.fields["reminderTime"] = model.reminderTime!;
    request.fields["reminderBreakTime"] = model.reminderBreakTime!;
    request.fields["reminderActivity"] = model.reminderActivity!;
    request.fields["reminderUser"] = model.reminderUser!;

    /*if(model.reminderImage != null) {
      http.MultipartFile multipartFile = await http.MultipartFile.fromPath(
        'reminderImage',
        model.reminderImage!,
      );

      request.files.add(multipartFile);
    }*/

    var response = await request.send();

    if(response.statusCode == 200){

      return true;
    } else {
      return false;
    }
  }

  static Future<bool> deleteReminder(reminderId) async{
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};

    var url = Uri.http(Config.apiURL, Config.remindersAPI + "/" + reminderId);

    var response = await client.delete(url, headers: requestHeaders);

    if(response.statusCode == 200){

      return true;
    } else {
      return false;
    }
  }
}