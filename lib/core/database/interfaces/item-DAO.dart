import 'package:list_of_lists/core/entity/item.dart';

abstract class ItemDAO {
  save(Item item);

  remove(int id);

  Future<List<Item>> find(int idList);
}
