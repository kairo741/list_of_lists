import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:list_of_lists/core/database/services/lista-service.dart';
import 'package:list_of_lists/core/entity/lista.dart';
import 'package:list_of_lists/ui/shared-components/shared-app-bar.dart';

import 'home-page.dart';

class HomeWidget extends State<HomePage> {
  var _service;
  Future<List<Lista>>? _list;

  @override
  void initState() {
    super.initState();
    _service = GetIt.I.get<ListaService>();
    _list = _service.find();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SharedAppBar(
        title: "Home",
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.add))],
      ),
      body: FutureBuilder(
          future: _list,
          builder: (context, future) {
            if (!future.hasData) {
              return Center(
                  child: CircularProgressIndicator(
                backgroundColor: Colors.cyan,
              ));
            } else {
              List<Lista> list = future.data as List<Lista>;
              return ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, i) {
                    var listObject = list[i];
                    return ListTile(
                        leading: Icon(Icons.person),
                        title: Text(
                          listObject.name,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(listObject.name),
                        trailing: Container(
                          width: 100,
                          child: Row(
                            children: [
                              IconButton(
                                  icon: Icon(Icons.edit),
                                  onPressed: () {
                                    // _back.goToForm(context, listObject);
                                  }),
                              // iconRemoveButton(context, listObject)
                            ],
                          ),
                        ));
                  });
            }
          }),
    );
  }
}
