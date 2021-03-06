import 'package:list_of_lists/core/database/interfaces/item-DAO.dart';
import 'package:list_of_lists/core/entity/item.dart';
import 'package:list_of_lists/core/utils/constants.dart';
import 'package:sqflite/sqflite.dart';

import '../connection.dart';

class ItemDAOImpl implements ItemDAO {
  Database? _db;
  var sql;

  @override
  Future<List<Item>> find(int idList) async {
    _db = await Connection.get();
    List<Map<String, dynamic>> result =
        await _db!.query(Constants.TABLE_ITEM, where: "id_list = $idList");
    List<Item> resultList = List.generate(result.length, (index) {
      var row = result[index];
      return Item(
        id: row[Item.ID],
        name: row[Item.NAME],
        urlPhoto: row[Item.URL_PHOTO],
        base64photo: row[Item.BASE64_PHOTO],
        idList: row[Item.ID_LIST],
        status: row[Item.STATUS],
        createDate: DateTime.parse(row[Item.CREATE_DATE]),
      );
    });
    return resultList;
  }

  @override
  remove(int id) async {
    _db = await Connection.get();
    sql = "DELETE FROM item WHERE id =? ";
    _db!.rawDelete(sql, [id]);
  }

  @override
  save(Item item) async {
    _db = await Connection.get();
    if (item.id == null) {
      sql = """INSERT INTO item (name, base64_photo,id_list, status) VALUES(?,?,?,?) """;
      _db!.rawInsert(sql, [item.name, item.base64photo,item.idList, item.status]);
    } else {
      sql = "UPDATE item SET name=?,base64_photo=?, status=? WHERE id=?";
      await _db!.rawUpdate(sql, [item.name,item.base64photo, item.status, item.id]);
    }
  }
}
