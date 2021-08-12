class Item {
  static const String ID = "id";
  static const String NAME = "name";
  static const String URL_PHOTO = "url_photo";
  static const String BASE64_PHOTO = "base64_photo";
  static const String ID_LIST = "id_list";
  static const String CREATE_DATE = "create_date";
  static const String STATUS = "status";

  int? id;
  String name;
  String? urlPhoto;
  String? base64photo;
  int idList;
  String status;
  DateTime? createDate;

  Item(
      {this.id,
      required this.name,
      required this.idList,
      this.base64photo,
      this.urlPhoto,
      required this.status,
      this.createDate});
}
