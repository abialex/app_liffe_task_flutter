import 'package:app_liffe_task_flutter/common/constants/app_const_colors.dart';
import 'package:app_liffe_task_flutter/common/constants/app_enum_radius.dart';
import 'package:app_liffe_task_flutter/common/constants/app_enum_spacing.dart';
import 'package:app_liffe_task_flutter/common/widget/app_responsive_base.dart';
import 'package:app_liffe_task_flutter/common/widget/app_text_style/app_text_style_mobile.dart';
import 'package:flutter/material.dart';

class AppButtonDark extends StatelessWidget {
  const AppButtonDark({
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
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppConstColors.dark,
          borderRadius: BorderRadius.circular(
            AppBorderRadiusEnum.small.radius,
          ),
        ),
        padding: padding ??
            EdgeInsets.symmetric(
              horizontal: AppSpacingEnum.small.size,
              vertical: AppSpacingEnum.extraSmall.size,
            ),
        child: AppResponsiveBase(
            mobile: AppConstTextMobile.body2(
              text: text,
              color: AppConstColors.white,
            ),
            web: AppConstTextMobile.body1(
              text: text,
              color: AppConstColors.white,
            )),
      ),
    );
  }
}
