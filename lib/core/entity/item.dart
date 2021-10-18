import 'package:intl/intl.dart';

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

  static Item fromJson(Map<String, dynamic> json) => Item(
        id: json[ID] as int?,
        name: json[NAME] as String,
        urlPhoto: json[URL_PHOTO] as String?,
        base64photo: json[BASE64_PHOTO] as String?,
        idList: json[ID_LIST] as int,
        status: json[STATUS] as String,
        createDate: json[CREATE_DATE] as DateTime?,
      );

  Map<String, dynamic> toJson() {
    return {
      ID: this.id,
      NAME: this.name,
      URL_PHOTO: this.urlPhoto,
      BASE64_PHOTO: this.base64photo,
      ID_LIST: this.idList,
      CREATE_DATE: this.createDate != null
          ? DateFormat('yyyy-MM-dd HH:mm:ss').format(this.createDate!)
          : null,
      STATUS: this.status,
    };
  }
}
