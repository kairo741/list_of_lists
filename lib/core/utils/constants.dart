import 'package:intl/intl.dart';

class Constants {
  static const TABLE_USER = "user";
  static const TABLE_LISTA = "lista";
  static const TABLE_ITEM = "item";

  static const APP_ICONS_FAMILY = "MaterialIcons";

  static const ACTIVE = "A";
  static const INACTIVE = "I";

  static const SERVER_IP = "https://lists-back.loca.lt";

  static const SAVE_USER_PATH = "/backup/save-user";

  static const FIND_LISTAS_PATH = "/backup/find-listas";

  static const FIND_ITENS_PATH = "/backup/find-itens";

  static const SAVE_LISTA_PATH = "/backup/save-lista";

  static const SAVE_ITEM_PATH = "/backup/save-item";

  static String getUrlDeleteLista(String id) =>
      Intl.message('/backup/delete-lista/$id', args: [id]);

  static String getUrlDeleteItem(String id) =>
      Intl.message('/backup/delete-item/$id', args: [id]);
}
