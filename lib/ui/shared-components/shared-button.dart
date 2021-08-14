import 'package:flutter/material.dart';
import 'package:list_of_lists/ui/styles/app-colors.dart';
import 'package:list_of_lists/ui/styles/app_text_styles.dart';

class SharedButton extends StatelessWidget {
  final String label;
  final IconData? icon;

  final GestureTapCallback? onTap;

  final bool readOnly;

  SharedButton(
      {this.onTap, required this.label, this.icon, this.readOnly = false});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        width: size.width,
        height: 50,
        decoration: BoxDecoration(
          color:
              onTap == null ? AppColors.kLineColor : AppColors.kPrimaryColor,
          // border: Border.all(color: Colors.black, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Material(
            color: Colors.transparent,
            child: InkWell(
                splashColor: AppColors.kSecondaryColor,
                onTap: onTap,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      icon,
                      color: AppColors.kUnviewColor,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      label,
                      style: AppTextStyles.titleBold,
                    )
                  ],
                ))));
  }
}
