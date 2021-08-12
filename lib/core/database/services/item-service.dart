import 'package:get_it/get_it.dart';
import 'package:list_of_lists/core/database/interfaces/item-DAO.dart';
import 'package:list_of_lists/core/entity/item.dart';

class ItemService {
  var _dao = GetIt.I.get<ItemDAO>();

  save(Item item) {
    validate(item);
    _dao.save(item);
  }

  remove(int id) {
    _dao.remove(id);
  }

  Future<List<Item>> find() {
    return _dao.find();
  }

  validate(Item item) {
    if (item.name == null) {
      throw new Exception("O nome é obrigatório!");
    }
  }
}
