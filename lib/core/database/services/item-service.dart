import 'package:get_it/get_it.dart';
import 'package:list_of_lists/core/database/interfaces/item-DAO.dart';
import 'package:list_of_lists/core/entity/item.dart';

class ItemService {
  var _dao = GetIt.I.get<ItemDAO>();

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
