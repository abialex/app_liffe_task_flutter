import 'package:app_liffe_task_flutter/common/constants/app_const_colors.dart';
import 'package:app_liffe_task_flutter/common/widget/buttons/app_basic_button.dart';
import 'package:flutter/material.dart';

class AppButtonWhite extends StatelessWidget {
  const AppButtonWhite({
    super.key,
    required this.onTap,
    required this.text,
    this.enable = true,
    this.padding,
  });
  final void Function() onTap;
  final String text;
  final bool enable;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return AppBasicButton(
      onTap: onTap,
      text: text,
      backgroundColor: AppConstColors.white,
      textColor: AppConstColors.dark,
      borderColor: AppConstColors.dark,
    );
  }
}
