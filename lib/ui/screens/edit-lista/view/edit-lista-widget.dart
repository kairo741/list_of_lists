import 'package:flutter/material.dart';
import 'package:list_of_lists/core/controller/lista/lista-controller.dart';
import 'package:list_of_lists/core/entity/lista.dart';
import 'package:list_of_lists/ui/screens/edit-lista/components/triple-icon-row.dart';
import 'package:list_of_lists/ui/shared-components/shared-app-bar.dart';
import 'package:list_of_lists/ui/shared-components/shared-asset-icon.dart';
import 'package:list_of_lists/ui/shared-components/shared-button.dart';
import 'package:list_of_lists/ui/shared-components/shared-text-field.dart';
import 'package:list_of_lists/ui/styles/app-colors.dart';
import 'package:list_of_lists/ui/styles/app_text_styles.dart';

class EditLista extends StatefulWidget {
  final Lista lista;
  final listaNameController = TextEditingController();
  final listaDateController = TextEditingController();

  EditLista({required this.lista});

  @override
  _EditLista createState() => _EditLista();
}

class _EditLista extends State<EditLista> {
  var oldName;
  var oldIcon;
  ListaController _controller = ListaController();

  @override
  void initState() {
    super.initState();
    oldName = widget.listaNameController.text;
    oldIcon = widget.lista.icon;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SharedAppBar(
        title: "Editar Lista",
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: ListView(
          children: [
            SharedAssetIcon(
              widget.lista.icon!,
              onPressed: () {
                _showModalBottomSheet(context);
              },
              buttonSize: Size(200, 200),
              iconSize: 150,
            ),
            SizedBox(
              height: 25,
            ),

            ///name
            SharedTextField(
              controller: widget.listaNameController,
              onChanged: (value) {
                setState(() {
                  widget.lista.name = value;
                });
              },
              icon: Icons.edit,
              labelText: "Nome da Lista",
              showLabelAboveTextField: true,
            ),
            SizedBox(
              height: 25,
            ),

            ///create_date
            SharedTextField(
              controller: widget.listaDateController,
              onChanged: (value) {},
              icon: Icons.date_range,
              labelText: "Data de Criação",
              showLabelAboveTextField: true,
              readOnly: true,
            ),
            SizedBox(
              height: 25,
            ),
            SharedButton(
              onTap: oldName == widget.listaNameController.text && oldIcon == widget.lista.icon
                  ? null
                  : () {
                      _finish(context);
                    },
              label: "Salvar",
              icon: Icons.send,
            )
          ],
        ),
      ),
    );
  }

  _finish(BuildContext context) {
    // _showDialog(context);
    _controller.preSaveLista(context, widget.lista);
    Navigator.of(context).pop();
  }


  _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Container(
            decoration: BoxDecoration(
                color: AppColors.levelButtonFacil,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30))),
            child: Padding(
              padding: const EdgeInsets.all(40),
              child: ListView(
                children: [
                  Text(
                    // todo - alterar para ficar fixo
                    "Icones diponíveis: ",
                    style: AppTextStyles.titleBoldBlack,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // todo - alterar essas ROWs para Grid.view
                  TripleIconRow(
                    icon1: Icons.ac_unit_sharp.codePoint,
                    onPressedIcon1: () {
                      setState(() {
                        widget.lista.icon = Icons.ac_unit_sharp.codePoint;
                        Navigator.of(context).pop();
                      });
                    },
                    icon2: Icons.adb_outlined.codePoint,
                    onPressedIcon2: () {
                      setState(() {
                        widget.lista.icon = Icons.adb_outlined.codePoint;
                        Navigator.of(context).pop();
                      });
                    },
                    icon3: Icons.account_circle_outlined.codePoint,
                    onPressedIcon3: () {
                      setState(() {
                        widget.lista.icon =
                            Icons.account_circle_outlined.codePoint;
                        Navigator.of(context).pop();
                      });
                    },
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  TripleIconRow(
                    icon1: Icons.account_balance_sharp.codePoint,
                    onPressedIcon1: () {
                      setState(() {
                        widget.lista.icon =
                            Icons.account_balance_sharp.codePoint;
                        Navigator.of(context).pop();
                      });
                    },
                    icon2: Icons.vpn_lock_outlined.codePoint,
                    onPressedIcon2: () {
                      setState(() {
                        widget.lista.icon = Icons.vpn_lock_outlined.codePoint;
                        Navigator.of(context).pop();
                      });
                    },
                    icon3: Icons.opacity.codePoint,
                    onPressedIcon3: () {
                      setState(() {
                        widget.lista.icon = Icons.opacity.codePoint;
                        Navigator.of(context).pop();
                      });
                    },
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  TripleIconRow(
                    icon1: Icons.wifi_tethering_outlined.codePoint,
                    onPressedIcon1: () {
                      setState(() {
                        widget.lista.icon =
                            Icons.wifi_tethering_outlined.codePoint;
                        Navigator.of(context).pop();
                      });
                    },
                    icon2:
                        Icons.airline_seat_legroom_reduced_outlined.codePoint,
                    onPressedIcon2: () {
                      setState(() {
                        widget.lista.icon = Icons
                            .airline_seat_legroom_reduced_outlined.codePoint;
                        Navigator.of(context).pop();
                      });
                    },
                    icon3: Icons.book_outlined.codePoint,
                    onPressedIcon3: () {
                      setState(() {
                        widget.lista.icon = Icons.book_outlined.codePoint;
                        Navigator.of(context).pop();
                      });
                    },
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  TripleIconRow(
                    icon1: Icons.assistant_navigation.codePoint,
                    onPressedIcon1: () {
                      setState(() {
                        widget.lista.icon =
                            Icons.assistant_navigation.codePoint;
                        Navigator.of(context).pop();
                      });
                    },
                    icon2: Icons.assistant.codePoint,
                    onPressedIcon2: () {
                      setState(() {
                        widget.lista.icon = Icons.assistant.codePoint;
                        Navigator.of(context).pop();
                      });
                    },
                    icon3: Icons.remove_red_eye.codePoint,
                    onPressedIcon3: () {
                      setState(() {
                        widget.lista.icon = Icons.remove_red_eye.codePoint;
                        Navigator.of(context).pop();
                      });
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
}
