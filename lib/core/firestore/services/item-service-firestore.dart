import 'package:get_it/get_it.dart';
import 'package:list_of_lists/core/entity/item.dart';
import 'package:list_of_lists/core/firestore/dao/item-DAO-firestore-impl.dart';
import 'package:list_of_lists/core/firestore/interfaces/item-DAO-firestore.dart';

class ItemServiceFirestore {
  var _dao = GetIt.I.get<ItemDAOFirestore>();

  save(Item item) async {
    validate(item);
    await _dao.save(item);
  }

  remove(int id) {
    _dao.remove(id);
  }

  Future<List<Item>> find(int idList) {
    return _dao.find(idList);
  }

  validate(Item item) {
    if (item.name == null) {
      throw new Exception("O nome é obrigatório!");
    }
  }
}
