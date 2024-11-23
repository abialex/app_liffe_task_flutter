import 'package:app_liffe_task_flutter/common/constants/app_enum_radius.dart';
import 'package:app_liffe_task_flutter/common/constants/app_enum_spacing.dart';
import 'package:app_liffe_task_flutter/common/widget/app_box.dart';
import 'package:app_liffe_task_flutter/common/widget/app_text_style/app_text_style_mobile.dart';
import 'package:flutter/material.dart';

class AppLabel extends StatelessWidget {
  const AppLabel({
    super.key,
    required this.backgroundColor,
    required this.textColor,
    this.suffixIcon,
    required this.text,
  });
  final Color backgroundColor;
  final Color textColor;
  final Widget? suffixIcon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: AppSpacingEnum.extraSmall.size),
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacingEnum.small.size,
        vertical: 2,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppBorderRadiusEnum.small.radius),
        color: backgroundColor,
      ),
      child: Row(
        children: [
          if (suffixIcon != null) ...[
            suffixIcon!,
            AppBox.w4,
          ],
          AppConstTextMobile.body3(
            text: text,
            color: textColor,
          )
        ],
      ),
    );
  }
}
