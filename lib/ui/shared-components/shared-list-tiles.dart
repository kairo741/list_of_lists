import 'package:flutter/material.dart';
import 'package:list_of_lists/ui/shared-components/shared-asset-icon.dart';
import 'package:list_of_lists/ui/styles/app-colors.dart';

class SharedListTiles extends StatelessWidget {
  final String title;
  final String? shortDescription;
  final int icon;
  final GestureTapCallback? onTap;
  final GestureLongPressCallback? onLongPress;
  final VoidCallback? deleteButton;
  final VoidCallback? editButton;

  SharedListTiles(
      {required this.title,
      this.shortDescription,
      required this.icon,
      this.onTap,
      this.onLongPress,
      this.deleteButton,
      this.editButton});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        contentPadding: EdgeInsets.all(10),
        leading: SharedAssetIcon(
          icon,
          buttonSize: Size(50, 50),
          iconSize: 30,
          onPressed: () {}, // todo - trocar para cor aleatória
        ),

        // Icon(
        //   IconData(icon, fontFamily: Constants.APP_ICONS_FAMILY),
        //   size: 50,
        // ),
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: shortDescription != null ? Text(shortDescription!) : null,
        trailing: Container(
          width: 100,
          child: Row(
            children: [
              ///EDIT BUTTON
              IconButton(icon: Icon(Icons.edit), onPressed: editButton),

              ///DELETE BUTTON
              IconButton(
                  icon: Icon(
                    Icons.delete_forever,
                    color: AppColors.kPrimaryColor,
                  ),
                  onPressed: deleteButton),
            ],
          ),
        ),
        onTap: onTap,
        onLongPress: onLongPress,
      ),
    );
  }
}
