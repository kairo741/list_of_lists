import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:list_of_lists/core/database/interfaces/item-DAO.dart';
import 'package:list_of_lists/core/entity/item.dart';
import 'package:list_of_lists/core/utils/constants.dart';

class ItemDAOFirestore implements ItemDAO {
  CollectionReference? itemCollection;

  ItemDAOFirestore() {
    itemCollection =
        FirebaseFirestore.instance.collection(Constants.TABLE_ITEM);
  }

  @override
  Future<List<Item>> find(int idList) async {
    var result = await itemCollection!.get();

    return result.docs
        .map((e) => Item(
            id: int.parse(e.reference.id),
            name: e[Item.NAME],
            urlPhoto: e[Item.URL_PHOTO],
            base64photo: e[Item.BASE64_PHOTO],
            idList: e[Item.ID_LIST],
            status: e[Item.STATUS],
            createDate: e[Item.CREATE_DATE]))
        .toList();
  }

  @override
  remove(int id) {
    itemCollection!.doc(id.toString()).delete();
  }

  @override
  save(Item item) {
    var id = item.id != null ? item.id.toString() : null;
    itemCollection!.doc(id).set({
      Item.NAME: item.name,
      Item.URL_PHOTO: item.urlPhoto,
      Item.BASE64_PHOTO: item.base64photo,
      Item.ID_LIST: item.idList,
      Item.STATUS: item.status,
      Item.CREATE_DATE: item.createDate,
    });
  }
}
