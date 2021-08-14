import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:list_of_lists/core/controller/item/item-controller.dart';
import 'package:list_of_lists/core/entity/item.dart';
import 'package:list_of_lists/core/entity/lista.dart';
import 'package:list_of_lists/core/utils/constants.dart';
import 'package:list_of_lists/ui/shared-components/shared-app-bar.dart';
import 'package:list_of_lists/ui/shared-components/shared-item-tiles.dart';
import 'package:list_of_lists/ui/styles/app-colors.dart';

class ItemListScreen extends StatefulWidget {
  final Lista lista;

  const ItemListScreen({
    Key? key,
    required this.lista,
  }) : super(key: key);

  @override
  ItemListWidget createState() => ItemListWidget();
}

class ItemListWidget extends State<ItemListScreen> {
  ItemController? itemController;
  var initialList;

  @override
  void initState() {
    super.initState();
    itemController = ItemController(widget.lista.id!);
    initialList = itemController!.refreshList(widget.lista.id!);
  }

  @override
  Widget build(BuildContext context) {
    // var list = itemController!.list;
    // if (initialList != list) {
    //   setState(() {
    //     itemController!.refreshList(widget.lista.id!);
    //   });
    // }
    return Scaffold(
      appBar: SharedAppBar(
        title: widget.lista.name,
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  itemController!.refreshList(widget.lista.id!);
                });
              },
              icon: Icon(Icons.refresh)),
          IconButton(
              onPressed: () {
                _newItem(context);
              },
              icon: Icon(Icons.add)),
        ],
      ),
      body: ListView(
        children: [
          Observer(builder: (context) {
            return FutureBuilder(
                future: itemController!.list,
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
                    List<Item> list = future.data as List<Item>;
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
                              child: SharedItemTiles(
                                title: lista.name,
                                onTap: () {},
                              ),
                            );
                          } else {
                            return Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, bottom: 2),
                              child: SharedItemTiles(
                                title: lista.name,
                                onTap: () {},
                              ),
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

  _newItem(BuildContext context) {
    return itemController!.newItem(context, widget.lista.id!);
  }
}
