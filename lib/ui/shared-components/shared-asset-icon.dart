import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:list_of_lists/core/utils/constants.dart';
import 'package:list_of_lists/ui/styles/app-colors.dart';

class SharedAssetIcon extends StatelessWidget {
  final int? icon;
  final dynamic image;
  final bool disabled;
  final Function()? onPressed;
  final String? tag;
  final Size? buttonSize;
  final double? iconSize;

  SharedAssetIcon({
    this.icon,
    this.onPressed,
    this.tag,
    this.disabled = false,
    this.buttonSize,
    this.iconSize,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    final onPressed = this.disabled ? null : this.onPressed;
    return Container(
      margin: EdgeInsets.only(right: 5),
      width: 82,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              ElevatedButton(
                  onPressed: onPressed,
                  onLongPress: null,
                  style: ElevatedButton.styleFrom(
                    primary: this.disabled
                        ? Colors.black45
                        : AppColors.kLabelButtonColor,
                    shape: CircleBorder(),
                    fixedSize: buttonSize != null ? buttonSize : Size(72, 72),
                    elevation: 0,
                  ),
                  child: _iconPicker()),
              if (tag != null)
                Positioned(
                  bottom: 0,
                  right: 18,
                  left: 18,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: AppColors.kPrimaryColor),
                    padding: EdgeInsets.symmetric(horizontal: 2, vertical: 1),
                    child: Text(
                      tag!,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.caption!.copyWith(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                )
            ],
          ),
        ],
      ),
    );
  }

  Widget _iconPicker() {
    if (image == null) {
      return Icon(
        IconData(icon!, fontFamily: Constants.APP_ICONS_FAMILY),
        color: AppColors.kTextColor,
        size: iconSize,
      );
    } else if (image is Uint8List) {
      return Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              fit: BoxFit.fill, image: MemoryImage(image)),
          // borderRadius: BorderRadius.all(Radius.circular(1000)),
          color: AppColors.kPrimaryColor,
        ),
      );
    } else {
      return Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(fit: BoxFit.fill, image: FileImage(image!)),
          color: AppColors.kPrimaryColor,
        ),
      );
    }
  }
}
