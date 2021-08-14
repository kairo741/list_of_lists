import 'package:flutter/material.dart';
import 'package:list_of_lists/ui/shared-components/shared-asset-icon.dart';

class TripleIconRow extends StatelessWidget {
  final int icon1;
  final int icon2;
  final int icon3;
  final Function()? onPressedIcon1;
  final Function()? onPressedIcon2;
  final Function()? onPressedIcon3;

  const TripleIconRow(
      {Key? key,
      required this.icon1,
      required this.icon2,
      required this.icon3,
      this.onPressedIcon1,
      this.onPressedIcon2,
      this.onPressedIcon3})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SharedAssetIcon(
          icon: icon1,
          onPressed: onPressedIcon1,
          // buttonSize: Size(200, 200),
          iconSize: 35,
        ),
        SharedAssetIcon(
          icon: icon2,
          onPressed: onPressedIcon2,
          // buttonSize: Size(200, 200),
          iconSize: 35,
        ),
        SharedAssetIcon(
          icon: icon3,
          onPressed: onPressedIcon3,
          // buttonSize: Size(200, 200),
          iconSize: 35,
        ),
      ],
    );
  }
}
