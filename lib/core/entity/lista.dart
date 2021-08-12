class Lista {
  static const String ID = "id";
  static const String NAME = "name";
  static const String ID_USER = "id_user";
  static const String CREATE_DATE = "create_date";
  static const String STATUS = "status";

  int? id;
  String name;
  int idUser;
  String status;
  DateTime? createDate;

  Lista(
      { this.id,
      required this.name,
      required this.idUser,
      required this.status,
      this.createDate});
}