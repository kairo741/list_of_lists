import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:list_of_lists/core/database/services/lista-service.dart';
import 'package:list_of_lists/core/entity/lista.dart';
import 'package:list_of_lists/ui/screens/edit-lista/view/edit-lista-widget.dart';
import 'package:mobx/mobx.dart';

part 'lista-controller.g.dart';

class ListaController = _ListaController with _$ListaController;

abstract class _ListaController with Store {
  // final listaNameController = TextEditingController();

  var listaController;
  var _service = GetIt.I.get<ListaService>();

  @observable
  Future<List<Lista>>? list;

  @action
  refreshList([dynamic param]) {
    list = _service.find();
  }

  _ListaController() {
    refreshList();
  }

  editLista(BuildContext context) {
    Lista lista = listaController as Lista;

    EditLista editLista = EditLista(
      lista: lista,
    );
    editLista.listaNameController.text = lista.name;
    editLista.listaDateController.text = DateFormat('dd/MM/yyyy - HH:mm:ss')
        .format(lista.createDate!)
        .toString();

    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => editLista))
        .then(refreshList);
  }
  removeLista(int id){
    _service.remove(id);
    refreshList();
  }

  preSaveLista(BuildContext context, Lista lista) async {
    _validate(lista);

    await _service.save(lista);
    refreshList();
  }

  _validate(Lista lista) {
    if (lista.name == null) {
      throw new Exception("O nome é obrigatório!");
    }
  }
}
