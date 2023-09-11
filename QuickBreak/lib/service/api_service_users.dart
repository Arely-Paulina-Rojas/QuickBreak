import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quickbreak/service/config.dart';

import '../models/user_model.dart';

class APIServiceUsers {
  static var client = http.Client();

  static Future<bool> saveUser(
        UserModel model,
      ) async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json', 'Access-Control-Allow-Origin': '*'};

    var userURL = Config.usersAPI;
    var url = Uri.http(Config.apiURL, userURL);

    var response = await client.post(url, headers: requestHeaders, body: jsonEncode(<String, String>{
      'userEmail': model.userEmail!, 'userPassword': model.userPassword!}));
    if(response.statusCode == 200){
      return true;
    }else{
      return false;
    }

  }

  static Future<String?> login(
        UserModel model,
      ) async{
    Map<String, String> requestHeaders = {'Content-Type': 'application/json', 'Access-Control-Allow-Origin': '*'};
    var userURL = Config.usersAPI + "/login";
    var url = Uri.http(Config.apiURL, userURL);
    var response = await client.post(url, headers: requestHeaders, body: jsonEncode(<String, String>{
      'userEmail': model.userEmail!, 'userPassword': model.userPassword!}));
    if(response.statusCode == 200){
     var data = jsonDecode(response.body);
     String? id = UserModel.fromJson(data["data"]).id;
      return id;
    }else{
      return "";
    }

}

  static Future<bool> getUsers() async{
    Map<String, String> requestHeaders = {'Content-Type': 'application/json', 'Access-Control-Allow-Origin': '*'};
    var url = Uri.http(Config.apiURL, Config.usersAPI);
    var response = await client.get(url, headers: requestHeaders);
    if(response.statusCode == 200){
      print("aa");
      return true;
    }else{
      print(response.statusCode);
      return false;

    }
  }
}