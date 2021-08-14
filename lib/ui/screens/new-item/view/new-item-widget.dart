import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:list_of_lists/core/controller/item/item-controller.dart';
import 'package:list_of_lists/core/entity/item.dart';
import 'package:list_of_lists/core/utils/constants.dart';
import 'package:list_of_lists/ui/shared-components/shared-app-bar.dart';
import 'package:list_of_lists/ui/shared-components/shared-asset-icon.dart';
import 'package:list_of_lists/ui/shared-components/shared-button.dart';
import 'package:list_of_lists/ui/shared-components/shared-text-field.dart';
import 'package:list_of_lists/ui/styles/app-colors.dart';
import 'package:list_of_lists/ui/styles/app_text_styles.dart';

class NewItem extends StatefulWidget {
  final int listId;

  const NewItem({Key? key, required this.listId}) : super(key: key);

  @override
  _NewItem createState() => _NewItem();
}

class _NewItem extends State<NewItem> {
  var itemController;

  @override
  void initState() {
    super.initState();
    itemController = ItemController(widget.listId);
  }

  var itemName, itemImage;
  final imagePicker = ImagePicker();
  bool itemStatus = true;
  File? _image;

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
            Center(
              child: Text(
                "Imagem (Opcional)",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[700],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SharedAssetIcon(
              icon: Icons.image.codePoint,
              image: _image,
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
              onChanged: (value) {
                itemName = value;
              },
              icon: Icons.edit,
              labelText: "Nome do Item",
              showLabelAboveTextField: true,
            ),
            SizedBox(
              height: 25,
            ),
            Center(
              child: Text(
                "Ativo?",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[700],
                ),
              ),
            ),
            Center(
              child: Transform.scale(
                scale: 1.5,
                child: Switch(
                  value: itemStatus,
                  onChanged: (value) {
                    setState(() {
                      itemStatus = value;
                    });
                  },
                  activeTrackColor: AppColors.kSecondaryColor,
                  activeColor: AppColors.kPrimaryColor,
                  inactiveThumbColor: AppColors.kLabelButtonColor,
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            SharedButton(
              onTap: () {
                _finish(context);
              },
              label: "Criar",
              icon: Icons.send,
            )
          ],
        ),
      ),
    );
  }

  Future _getImage(ImageSource source) async {
    final image = await ImagePicker()
        .pickImage(source: source, maxHeight: 700, maxWidth: 700);

    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  _showModalBottomSheet(BuildContext context) async {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        isScrollControlled: false,
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height * .2,
            decoration: BoxDecoration(
                color: AppColors.levelButtonFacil,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30))),
            child: ListView(
              shrinkWrap: true,
              children: [
                SizedBox(
                  height: 10,
                ),
                TextButton.icon(
                    icon: Icon(Icons.image),
                    onPressed: () {
                      _getImage(ImageSource.gallery);
                      Navigator.of(context).pop();
                    },
                    label: Text("Galeria", style: AppTextStyles.textBlackBold)),
                SizedBox(
                  height: 10,
                ),
                TextButton.icon(
                    icon: Icon(Icons.camera_alt),
                    onPressed: () {
                      _getImage(ImageSource.camera);
                      Navigator.of(context).pop();
                    },
                    label: Text(
                      "Câmera",
                      style: AppTextStyles.textBlackBold,
                    )),
              ],
            ),
          );
        });
  }

  _finish(BuildContext context) {
    var newItem = Item(
        name: itemName,
        status: itemStatus ? Constants.ACTIVE : Constants.INACTIVE,
        base64photo: _image != null ? base64Encode(_image!.readAsBytesSync()) : null,
        idList: widget.listId);

    itemController.preSaveItem(context, newItem);
    // Navigator.of(context).pushAndRemoveUntil(
    //     MaterialPageRoute(builder: (context) => HomePage()), (route) => false);
  }
}
