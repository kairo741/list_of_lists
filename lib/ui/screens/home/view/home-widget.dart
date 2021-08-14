import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:list_of_lists/core/controller/lista/lista-controller.dart';
import 'package:list_of_lists/core/entity/lista.dart';
import 'package:list_of_lists/core/utils/constants.dart';
import 'package:list_of_lists/ui/shared-components/shared-alert-box.dart';
import 'package:list_of_lists/ui/shared-components/shared-app-bar.dart';
import 'package:list_of_lists/ui/shared-components/shared-list-tiles.dart';
import 'package:list_of_lists/ui/styles/app_text_styles.dart';

import 'home-page.dart';

class HomeWidget extends State<HomePage> {
  ListaController controller = ListaController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SharedAppBar(
        title: "Home",
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  controller.refreshList();
                });
              },
              icon: Icon(Icons.refresh)),
          IconButton(onPressed: () {}, icon: Icon(Icons.add)),
        ],
      ),
      body: ListView(
        children: [
          Observer(builder: (context) {
            return FutureBuilder(
                future: controller.list,
                builder: (context, future) {
                  if (!future.hasData) {
                    return Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Center(
                          child: CircularProgressIndicator(
                        backgroundColor: Colors.cyan,
                      )),
                    );
                  } else {
                    List<Lista> list = future.data as List<Lista>;
                    return ListView.builder(
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
                                icon: lista.icon,
                                onTap: () {},
                                editButton: () {
                                  controller.listaController = lista;
                                  controller.editLista(context);
                                },
                                deleteButton: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) => SharedAlertBox(
                                            content: RichText(
                                              text: TextSpan(
                                                  text:
                                                      "Essa ação excluirá a lista ",
                                                  style: AppTextStyles.body16,
                                                  children: [
                                                    TextSpan(
                                                        text: lista.name,
                                                        style: AppTextStyles
                                                            .textBlackBold)
                                                  ]),
                                            ),
                                            title: "Tem certeza?",
                                            actionButtonText: "Excluir",
                                            actionButtonOnPressed: () {
                                              controller.removeLista(lista.id!);
                                              Navigator.of(context).pop();
                                            },
                                          ));

                                  // controller.listaController = lista;
                                  // controller.editLista(context);
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
}
