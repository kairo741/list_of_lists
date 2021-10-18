import 'package:intl/intl.dart';

class Lista {
  static const String ID = "id";
  static const String NAME = "name";
  static const String ICON = "icon";
  static const String ID_USER = "id_user";
  static const String CREATE_DATE = "create_date";
  static const String STATUS = "status";

  int? id;
  String name;
  int? icon;
  int idUser;
  String? status;
  DateTime? createDate;

  Lista(
      {this.id,
      required this.name,
      this.icon,
      required this.idUser,
      this.status,
      this.createDate});

  static Lista fromJson(Map<String, dynamic> json) => Lista(
        id: json[ID] as int?,
        name: json[NAME] as String,
        icon: json[ICON] as int?,
        idUser: json[ID_USER] as int,
        status: json[STATUS] as String?,
        createDate: json[CREATE_DATE] as DateTime?,
      );

  Map<String, dynamic> toJson() {
    return {
      ID: this.id,
      NAME: this.name,
      ICON: this.icon,
      ID_USER: this.idUser,
      STATUS: this.status,
      CREATE_DATE: this.createDate != null
          ? DateFormat('yyyy-MM-dd HH:mm:ss').format(this.createDate!)
          : null,
    };
  }
}
