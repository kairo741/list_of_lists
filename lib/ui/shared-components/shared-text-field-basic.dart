import 'package:flutter/material.dart';
import 'package:list_of_lists/ui/styles/app-colors.dart';

class SharedTextFieldBasic extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final String? hintText;
  final TextEditingController? controller;
  final IconData? icon;
  final bool readOnly;
  final bool autoFocus;

  SharedTextFieldBasic(
      {required this.onChanged,
      this.hintText,
      this.icon,
      this.controller,
      this.readOnly = false, this.autoFocus = false});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width,
      decoration: BoxDecoration(
          color: AppColors.levelButtonFacil,
          borderRadius: BorderRadius.circular(8)),
      child: TextField(
        autofocus: autoFocus,
        readOnly: readOnly,
        controller: controller,
        textAlign: TextAlign.center,
        onChanged: onChanged,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: AppColors.kPrimaryColor,
          ),
          fillColor: AppColors.levelButtonFacil,
          filled: true,
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
