import 'package:app_liffe_task_flutter/common/constants/app_enum_radius.dart';
import 'package:app_liffe_task_flutter/common/constants/app_enum_spacing.dart';
import 'package:app_liffe_task_flutter/common/widget/app_responsive_base.dart';
import 'package:app_liffe_task_flutter/common/widget/app_text_style/app_text_style_mobile.dart';
import 'package:flutter/material.dart';

class AppBasicButton extends StatelessWidget {
  const AppBasicButton({
    super.key,
    required this.onTap,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    required this.borderColor,
    this.enable = true,
    this.padding,
  });
  final void Function() onTap;
  final String text;
  final bool enable;
  final EdgeInsets? padding;
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(
            AppBorderRadiusEnum.small.radius,
          ),
          border: Border.all(color: borderColor),
        ),
        padding: padding ??
            EdgeInsets.symmetric(
              horizontal: AppSpacingEnum.small.size,
              vertical: AppSpacingEnum.extraSmall.size,
            ),
        child: AppResponsiveBase(
            mobile: AppConstTextMobile.body2(
              text: text,
              color: textColor,
            ),
            web: AppConstTextMobile.body1(
              text: text,
              color: textColor,
            )),
      ),
    );
  }
}
