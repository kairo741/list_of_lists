import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:list_of_lists/core/controller/item/item-controller.dart';
import 'package:list_of_lists/core/controller/lista/lista-controller.dart';
import 'package:list_of_lists/core/controller/user/user-controller.dart';
import 'package:list_of_lists/core/entity/lista.dart';
import 'package:list_of_lists/core/utils/constants.dart';
import 'package:list_of_lists/ui/shared-components/shared-alert-box.dart';
import 'package:list_of_lists/ui/shared-components/shared-app-bar.dart';
import 'package:list_of_lists/ui/shared-components/shared-list-tiles.dart';
import 'package:list_of_lists/ui/shared-components/shared-text-pop-up.dart';
import 'package:list_of_lists/ui/styles/app-colors.dart';
import 'package:list_of_lists/ui/styles/app_text_styles.dart';

import 'home-page.dart';

class HomeWidget extends State<HomePage> {
  ListaController listaController = ListaController();
  UserController userController = UserController();

  var user;

  @override
  void initState() {
    super.initState();
    _getUser();
  }

  _getUser() async {
    user = await userController
        .getUser(); // todo fazer tela de carregamento para carregar usuário
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SharedAppBar(
        title: "Seja bem vindo, " + user.name + "!",
        actions: [
          IconButton(
              onPressed: () {
                _newLista(context);
              },
              icon: Icon(Icons.add)),
        ],
      ),
      body: ListView(
        // shrinkWrap: true,
        children: [
          Observer(builder: (context) {
            return FutureBuilder(
                future: listaController.list,
                builder: (context, future) {
                  if (!future.hasData) {
                    return Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Center(
                          child: CircularProgressIndicator(
                        backgroundColor: AppColors.kSecondaryColor,
                      )),
                    );
                  } else {
                    List<Lista> list = future.data as List<Lista>;
                    return ListView.builder(
                        physics: ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: list.length,
                        itemBuilder: (context, i) {
                          var lista = list[i];
                          if (lista.status == Constants.ACTIVE) {
                            return Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, bottom: 2),
                              child: SharedListTiles(
                                title: lista.name,
                                icon: lista.icon!,
                                onTap: () {
                                  ItemController itemController =
                                      ItemController(lista.id!);
                                  return itemController.goToItems(
                                      context, lista);
                                },
                                editButton: () {
                                  listaController.listaController = lista;
                                  listaController.editLista(context);
                                },
                                deleteButton: () {
                                  _deleteLista(context, lista);
                                },
                              ),
                            );
                          } else {
                            return Container(
                              height: 0,
                              width: 0,
                            );
                          }
                        });
                  }
                });
          })
        ],
      ),
    );
  }

  _newLista(BuildContext context) {
    var newLista;
    return showDialog(
        context: context,
        builder: (context) => SharedTextPopUp(
              onChanged: (value) {
                newLista = Lista(name: value, idUser: user.id!);
              },
              actionButtonText: "Criar",
              hintText: "Nome da lista",
              title: "Nova Lista",
              icon: Icons.add_box_outlined,
              actionButtonOnPressed: () {
                if (newLista != null) {
                  listaController.preSaveLista(context, newLista);
                  Navigator.of(context).pop();
                }
              },
            ));
  }

  _deleteLista(BuildContext context, Lista lista) {
    return showDialog(
        context: context,
        builder: (context) => SharedAlertBox(
              content: RichText(
                text: TextSpan(
                    text: "Essa ação excluirá a lista ",
                    style: AppTextStyles.body16,
                    children: [
                      TextSpan(
                          text: lista.name, style: AppTextStyles.textBlackBold)
                    ]),
              ),
              title: "Tem certeza?",
              actionButtonText: "Excluir",
              actionButtonOnPressed: () {
                listaController.removeLista(lista.id!);
                Navigator.of(context).pop();
              },
            ));
  }
}
