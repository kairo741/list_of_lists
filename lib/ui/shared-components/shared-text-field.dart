import 'package:flutter/material.dart';
import 'package:list_of_lists/ui/styles/app-colors.dart';

class SharedTextField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final String? hintText;
  final TextEditingController? controller;
  final IconData? icon;
  final String? labelText;
  final bool? showLabelAboveTextField;
  final bool readOnly;

  SharedTextField(
      {required this.onChanged,
      this.hintText,
      this.icon,
      this.controller,
      this.labelText,
      this.showLabelAboveTextField,
      this.readOnly = false});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        if (labelText != null &&
            showLabelAboveTextField != null &&
            showLabelAboveTextField!) ...[
          Text(
            labelText!,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.grey[700],
            ),
          ),
        ],
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          width: size.width,
          decoration: BoxDecoration(
              color: AppColors.levelButtonFacil,
              borderRadius: BorderRadius.circular(8)),
          child: TextField(
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
        ),
      ],
    );
  }
}
