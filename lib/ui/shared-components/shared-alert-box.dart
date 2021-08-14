import 'package:flutter/material.dart';
import 'package:list_of_lists/ui/styles/app-colors.dart';
import 'package:list_of_lists/ui/styles/app_text_styles.dart';

class SharedAlertBox extends StatelessWidget {
  final String actionButtonText;
  final VoidCallback? actionButtonOnPressed;
  final String title;
  final Widget? content;

  const SharedAlertBox(
      {Key? key,
      required this.actionButtonText,
      required this.title,
      required this.content,
      this.actionButtonOnPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        style: AppTextStyles.titleBoldBlack,
      ),
      content: content,
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
