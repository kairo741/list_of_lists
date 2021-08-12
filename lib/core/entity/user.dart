

class User{

  static const String ID = "id";
  static const String NAME = "name";
  static const String CREATE_DATE = "create_date";
  static const String STATUS = "status";

  int? id;
  String name;
  String? status;
  DateTime? createDate;

  User({ this.id, required this.name, required this.status, this.createDate});


}