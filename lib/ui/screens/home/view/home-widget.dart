import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:list_of_lists/core/controller/lista/lista-controller.dart';
import 'package:list_of_lists/core/database/services/lista-service.dart';
import 'package:list_of_lists/core/entity/lista.dart';
import 'package:list_of_lists/core/utils/constants.dart';
import 'package:list_of_lists/ui/shared-components/shared-app-bar.dart';
import 'package:list_of_lists/ui/shared-components/shared-list-tiles.dart';

import 'home-page.dart';

class HomeWidget extends State<HomePage> {
  Future<List<Lista>>? _list;

  ListaController controller = ListaController();

  @override
  void initState() {
    super.initState();
    var _service = GetIt.I.get<ListaService>();
    _list = _service.find();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SharedAppBar(
        title: "Home",
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.add))],
      ),
      body: ListView(
        children: [
          FutureBuilder(
              future: _list,
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
                            padding: const EdgeInsets.only(top: 8.0, bottom: 2),
                            child: SharedListTiles(
                              title: lista.name,
                              icon: lista.icon,
                              onTap: () {},
                              editButton: () {
                                controller.listaController = lista;
                                controller.editLista(context);
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
              }),
        ],
      ),
    );
  }
}
