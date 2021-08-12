import 'package:flutter/material.dart';
import 'package:list_of_lists/ui/styles/app-colors.dart';
import 'package:list_of_lists/ui/styles/app_text_styles.dart';

class SharedAppBar extends PreferredSize {
  final String title;
  final List<Widget>? actions;

  SharedAppBar({required this.title, this.actions})
      : super(
            preferredSize: Size.fromHeight(50),
            child: AppBar(
              title: Text(
                title,
                textAlign: TextAlign.justify,
                style: AppTextStyles.titleBold,
              ),
              actions: actions,
              backgroundColor: AppColors.kPrimaryColor,
            ));
}
