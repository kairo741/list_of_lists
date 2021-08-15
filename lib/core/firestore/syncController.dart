import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:list_of_lists/core/controller/item/item-controller.dart';
import 'package:list_of_lists/core/controller/lista/lista-controller.dart';
import 'package:list_of_lists/core/controller/user/user-controller.dart';
import 'package:list_of_lists/core/firestore/services/item-service-firestore.dart';
import 'package:list_of_lists/core/firestore/services/lista-service-firestore.dart';
import 'package:list_of_lists/core/firestore/services/user-service-firestore.dart';
import 'package:list_of_lists/ui/styles/app-colors.dart';

class SyncController {
  ListaController listaController = ListaController();
  UserController userController = UserController();
  var _userService = GetIt.I.get<UserServiceFirestore>();
  var _listaService = GetIt.I.get<ListaServiceFirestore>();
  var _itemService = GetIt.I.get<ItemServiceFirestore>();

  syncWithFirestore(BuildContext context) async {
    var users = await userController.list;
    var listas = await listaController.list;

    if (users != null) {
      users.forEach((element) {
        _userService.save(element);
      });
      _responseMessage(context, "Usuários salvos na nuvem!");
    }

    if (listas != null) {
      listas.forEach((element) async {
        _listaService.save(element);
        ItemController _itemController = ItemController(element.id!);
        var items = await _itemController.list;
        if (items != null) {
          items.forEach((element) {
            _itemService.save(element);
          });
        }
      });
      _responseMessage(context, "Listas e Itens salvos na nuvem!");
    }
  }

  _responseMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: AppColors.kPrimaryColor,
        content: Container(
          child: Text(
            message,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        )));
  }
}
