import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:list_of_lists/ui/styles/app-colors.dart';
import 'package:list_of_lists/ui/styles/app_text_styles.dart';

class OptionsAlertBox extends StatelessWidget {
  // final List<Widget>? actions;
  final String title;
  final Widget? content;

  const OptionsAlertBox({
    Key? key,
    // required this.actions,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(

      shape:  Border.all(color: AppColors.kPrimaryColor, width: 5),
        title: Text(
          title,
          style: AppTextStyles.titleBoldBlack,
          overflow: TextOverflow.ellipsis,
        ),
        content: content,
    );
  }
}
