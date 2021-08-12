import 'package:list_of_lists/core/database/interfaces/user-DAO.dart';
import 'package:list_of_lists/core/entity/user.dart';
import 'package:list_of_lists/core/utils/constants.dart';
import 'package:sqflite/sqflite.dart';

import '../connection.dart';

class UserDAOImpl implements UserDAO {
  Database? _db;
  var sql;

  @override
  Future<List<User>> find() async {
    _db = await Connection.get();
     List<Map<String,dynamic>> result = await _db!.query(Constants.TABLE_USER);
     List<User> resultList = List.generate(result.length, (index){
       var row = result[index];
       return User(
         id: row[User.ID],
         name: row[User.NAME],
         status: row[User.STATUS],
         createDate: row[User.CREATE_DATE],
       );
     });
     return resultList;
  }

  @override
  remove(int id) async {
    _db = await Connection.get();
    sql = "DELETE FROM user WHERE id =? ";
    _db!.rawDelete(sql, [id]);
  }

  @override
  save(User user) async {
    _db = await Connection.get();
    if (user.id == null) {
      sql = """INSERT INTO user (name) VALUES(?) """;
      _db!.rawInsert(sql, [user.name]);
    } else {
      sql = "UPDATE user SET name=? WHERE id=?";
      _db!.rawUpdate(sql, [user.name]);
    }
  }
}