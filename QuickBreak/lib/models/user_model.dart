List<UserModel> usersFromJson(dynamic str) =>
    List<UserModel>.from((str).map((x) => UserModel.fromJson(x)));

class UserModel {
  late String? id;
  late String? userEmail;
  late String? userPassword;

  UserModel({
    this.id,
    this.userEmail,
    this.userPassword
  });

  UserModel.fromJson(Map<String, dynamic> json){
    id = json["_id"];
    userEmail = json["userEmail"];
    userPassword = json["userPassword"];
  }

  Map<String, dynamic> toJson(){
    final _data = <String, dynamic>{};

    _data["_id"] = id;
    _data["userEmail"] = userEmail;
    _data["userPassword"] = userPassword;

    return _data;
  }
}