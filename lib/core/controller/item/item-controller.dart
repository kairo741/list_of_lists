import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:list_of_lists/core/database/services/item-service.dart';
import 'package:list_of_lists/core/entity/item.dart';
import 'package:list_of_lists/core/entity/lista.dart';
import 'package:list_of_lists/ui/screens/item/view/item-list.dart';
import 'package:list_of_lists/ui/screens/new-item/view/new-item-widget.dart';
import 'package:list_of_lists/ui/shared-components/MyCustomRoute.dart';
import 'package:list_of_lists/ui/styles/app-colors.dart';
import 'package:mobx/mobx.dart';

part 'item-controller.g.dart';

class ItemController = _ItemController with _$ItemController;

abstract class _ItemController with Store {
  var _service = GetIt.I.get<ItemService>();

  @observable
  Future<List<Item>>? list;

  @action
  refreshList(int idList) {
    list = _service.find(idList);
  }

  _ItemController(int idList) {
    refreshList(idList);
  }

  goToItems(BuildContext context, Lista lista) {
    ItemListScreen screen = ItemListScreen(
      lista: lista,
    );

    Navigator.of(context)
        .push(MyCustomRoute(builder: (context) => screen))
        .then(refreshList(lista.id!));
  }

  newItem(BuildContext context, int idList) {
    NewItem screen = NewItem(
      listId: idList,
    );

    Navigator.of(context).push(MaterialPageRoute(builder: (context) => screen));
  }

  editItem(BuildContext context, int idList, Item item) {
    NewItem screen = NewItem(
      listId: idList,
    );
    screen.itemNameController.text = item.name;
    screen.editItem = item;

    Navigator.of(context).push(MaterialPageRoute(builder: (context) => screen));
  }

  preSaveItem(BuildContext context, Item item) async {
    await _service.save(item);
    refreshList(item.idList);
    Navigator.of(context).pop();
  }

  removeItem(int id, int idList) {
    _service.remove(id);
    refreshList(idList);
  }
}
