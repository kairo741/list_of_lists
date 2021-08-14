import 'package:flutter/material.dart';

class SharedItemTiles extends StatelessWidget {
  final String title;
  final String? shortDescription;

  // final int icon;
  final GestureTapCallback? onTap;
  final GestureLongPressCallback? onLongPress;

  SharedItemTiles({
    required this.title,
    this.shortDescription,
    // required this.icon,
    this.onTap,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        contentPadding: EdgeInsets.all(10),
        // leading: SharedAssetIcon(
        //   icon,
        //   buttonSize: Size(50, 50),
        //   iconSize: 30,
        //   onPressed: () {}, // todo - trocar para cor aleatória
        // ),

        // Icon(
        //   IconData(icon, fontFamily: Constants.APP_ICONS_FAMILY),
        //   size: 50,
        // ),
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: shortDescription != null ? Text(shortDescription!) : null,
        onTap: onTap,
        onLongPress: onLongPress,
      ),
    );
  }
}
