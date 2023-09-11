List<ReminderModel> remindersFromJson(dynamic str) =>
    List<ReminderModel>.from((str).map((x) => ReminderModel.fromJson(x)));

class ReminderModel {
  late String? id;
  late String? reminderName;
  late String? reminderTime;
  late String? reminderBreakTime;
  late String? reminderActivity;
  late String? reminderImage;
  late String? reminderUser;

  ReminderModel({
    this.id,
    this.reminderName,
    this.reminderTime,
    this.reminderBreakTime,
    this.reminderActivity,
    this.reminderImage,
    this.reminderUser
  });

  ReminderModel.fromJson(Map<String, dynamic> json){
    id = json["_id"];
    reminderName = json["reminderName"];
    reminderTime = json["reminderTime"];
    reminderBreakTime = json["reminderBreakTime"];
    reminderActivity = json["reminderActivity"];
    reminderImage = json["reminderImage"];
    reminderUser = json["reminderUser"];
  }

  Map<String, dynamic> toJson(){
    final _data = <String, dynamic>{};

    _data["_id"] = id;
    _data["reminderName"] = reminderName;
    _data["reminderTime"] = reminderTime;
    _data["reminderBreakTime"] = reminderBreakTime;
    _data["reminderActivity"] = reminderActivity;
    _data["reminderImage"] = reminderImage;
    _data["reminderUser"] = reminderUser;

    return _data;
  }



}