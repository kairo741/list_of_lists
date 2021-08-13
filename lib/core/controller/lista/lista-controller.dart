import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:list_of_lists/core/entity/lista.dart';
import 'package:list_of_lists/ui/screens/edit-lista/view/edit-lista-widget.dart';
import 'package:list_of_lists/ui/shared-components/show-loading-widget.dart';
import 'package:intl/intl.dart';

class ListaController {
  final listaNameController = TextEditingController();

  var listaController;

  editLista(BuildContext context) {
    ShowLoadingWidget.showLoadingLabel(context, "Editar Lista");

    Lista lista = listaController as Lista;

    Navigator.pop(context);

    EditLista editLista = EditLista(
      lista: lista,
    );
    editLista.listaNameController.text = lista.name;
    editLista.listaDateController.text = DateFormat('dd/MM/yyyy - HH:mm:ss').format(lista.createDate!).toString();

    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => editLista));
  }
}
