import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:list_of_lists/ui/styles/app-colors.dart';

class SharedItemTiles extends StatelessWidget {
  final String title;
  final String? shortDescription;
  final String? image;

  // final int icon;
  final GestureTapCallback? onTap;
  final GestureLongPressCallback? onLongPress;

  SharedItemTiles({
    required this.title,
    this.shortDescription,
    // required this.icon,
    this.onTap,
    this.onLongPress,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        contentPadding: EdgeInsets.all(10),

        leading: image != null
            ? Container(
          height: 72,
                width: 72,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: MemoryImage(base64Decode(image!))),
                  // borderRadius: BorderRadius.all(Radius.circular(1000)),
                  color: AppColors.kPrimaryColor,
                ),
              )
            : null,
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
