import 'package:list_of_lists/core/database/script.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Connection {
  static Database? _db;

  static Future<Database?> get() async {
    if (_db == null) {
      var path = join(await getDatabasesPath(), "listsDatabase");
      deleteDatabase(path);
      _db = await openDatabase(path, version: 1, onCreate: (db, dbVersion) {
        db.execute(createUser);
        db.execute(createLista);
        db.execute(createItem);
        db.execute(insertUser);
        db.execute(insertItem);
        db.execute(insertLista);
      });
    }
    return _db;
  }
}