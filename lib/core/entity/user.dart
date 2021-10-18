import 'package:intl/intl.dart';

class User {
  static const String ID = "id";
  static const String NAME = "name";
  static const String CREATE_DATE = "create_date";
  static const String STATUS = "status";

  int? id;
  String name;
  String? status;
  DateTime? createDate;

  User({this.id, required this.name, required this.status, this.createDate});

  static User fromJson(Map<String, dynamic> json) => User(
        id: json[ID] as int?,
        name: json[NAME] as String,
        status: json[STATUS] as String?,
        createDate: json[CREATE_DATE] as DateTime?,
      );

  Map<String, dynamic> toJson() {
    return {
      ID: this.id,
      NAME: this.name,
      CREATE_DATE: this.createDate != null
          ? DateFormat('yyyy-MM-dd HH:mm:ss').format(this.createDate!)
          : null,
      STATUS: this.status,
    };
  }
}
