import 'package:flutter/material.dart';
import 'package:list_of_lists/core/database/interfaces/lista-DAO.dart';
import 'package:list_of_lists/core/entity/lista.dart';
import 'package:list_of_lists/core/utils/constants.dart';
import 'package:sqflite/sqflite.dart';

import '../connection.dart';

class ListaDAOImpl implements ListaDAO {
  Database? _db;
  var sql;

  @override
  Future<List<Lista>> find() async {
    _db = await Connection.get();
    List<Map<String, dynamic>> result = await _db!.query(Constants.TABLE_LISTA);
    try {
      List<Lista> resultList = List.generate(result.length, (index) {
        var row = result[index];
        return Lista(
          id: row[Lista.ID],
          name: row[Lista.NAME],
          icon: row[Lista.ICON],
          idUser: row[Lista.ID_USER],
          status: row[Lista.STATUS],
          createDate: DateTime.parse(row[Lista.CREATE_DATE]),
        );
      });
      return resultList;
    } catch (e) {
      debugPrint(e.toString());
    }
    return <Lista>[];
  }

  @override
  remove(int id) async {
    _db = await Connection.get();
    sql = "DELETE FROM lista WHERE id =? ";
    _db!.rawDelete(sql, [id]);
  }

  @override
  save(Lista lista) async {
    _db = await Connection.get();
    if (lista.id == null) {
      sql = """INSERT INTO lista (name, id_user) VALUES(?,?) """;
      _db!.rawInsert(sql, [lista.name, lista.idUser]);
    } else {
      sql = "UPDATE lista SET name=?, icon=? WHERE id=?";
      debugPrint("UPDATE lista SET name=" +
          lista.name +
          " icon=" +
          lista.icon.toString() +
          " WHERE id=" +
          lista.id.toString());
      _db!.rawUpdate(sql, [lista.name, lista.icon, lista.id]);
    }
  }
}
