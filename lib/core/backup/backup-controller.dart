import 'package:flutter/material.dart';
import 'package:list_of_lists/core/backup/services/item-service-back-api.dart';
import 'package:list_of_lists/core/backup/services/lista-service-back-api.dart';
import 'package:list_of_lists/core/backup/services/user-service-back-api.dart';
import 'package:list_of_lists/core/controller/item/item-controller.dart';
import 'package:list_of_lists/core/controller/lista/lista-controller.dart';
import 'package:list_of_lists/core/controller/user/user-controller.dart';
import 'package:list_of_lists/core/entity/Info.dart';
import 'package:list_of_lists/ui/styles/app-colors.dart';

class BackupController {
  ListaController listaController = ListaController();
  UserController userController = UserController();
  UserServiceApiBack _userService = UserServiceApiBack();
  ListaServiceApiBack _listaService = ListaServiceApiBack();
  ItemServiceApiBack _itemService = ItemServiceApiBack();

  syncWithBackAPI(BuildContext context) async {
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

  deleteItem(int id) async {
    var info = _itemService.remove(id);
    return info;
  }

  deleteLista(int id) async {
    var info = await _listaService.remove(id);
    return info;
  }

  findAllItens() async {
    var list = await _itemService.find();
    return list;
  }

  findAllListas() async {
    var list = await _listaService.find();
    return list;
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
