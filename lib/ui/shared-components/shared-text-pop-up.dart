import 'package:flutter/material.dart';
import 'package:list_of_lists/ui/shared-components/shared-text-field-basic.dart';
import 'package:list_of_lists/ui/styles/app-colors.dart';
import 'package:list_of_lists/ui/styles/app_text_styles.dart';

class SharedTextPopUp extends StatelessWidget {
  final String actionButtonText;
  final ValueChanged<String> onChanged;
  final VoidCallback? actionButtonOnPressed;
  final String title;
  final String? hintText;
  final IconData? icon;

  const SharedTextPopUp(
      {Key? key,
      required this.actionButtonText,
      required this.title,
      this.actionButtonOnPressed,
      this.hintText,
      required this.onChanged, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        style: AppTextStyles.titleBoldBlack,
      ),
      content: SharedTextFieldBasic(
        autoFocus: true,
        icon: icon,
        onChanged: onChanged,
        hintText: hintText,
      ),
      actions: [
        TextButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(AppColors.kPrimaryColor),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              "Cancelar",
              style: AppTextStyles.body16white,
            )),
        TextButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(AppColors.kPrimaryColor),
            ),
            onPressed: actionButtonOnPressed,
            child: Text(
              actionButtonText,
              style: AppTextStyles.body16white,
            )),
      ],
    );
  }
}
