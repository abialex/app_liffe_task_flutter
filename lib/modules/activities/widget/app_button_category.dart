import 'package:app_liffe_task_flutter/common/constants/app_const_colors.dart';
import 'package:app_liffe_task_flutter/common/constants/app_enum_radius.dart';
import 'package:app_liffe_task_flutter/common/constants/app_enum_spacing.dart';
import 'package:app_liffe_task_flutter/common/widget/app_text_style/app_text_style_mobile.dart';
import 'package:flutter/material.dart';

class AppButtonCategory extends StatelessWidget {
  const AppButtonCategory({
    super.key,
    required this.onTap,
    this.isSelected,
    this.text,
    this.icon,
  });
  final void Function() onTap;
  final String? text;
  final Widget? icon;
  final bool? isSelected;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: (isSelected ?? false) ? AppConstColors.purple400 : AppConstColors.purple200,
          borderRadius: BorderRadius.circular(
            AppBorderRadiusEnum.small.radius,
          ),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: AppSpacingEnum.medium.size,
          vertical: AppSpacingEnum.extraSmall.size,
        ),
        child: text != null
            ? AppConstTextMobile.body1(
                text: text!,
                // color: AppConstColors.white,
                fontWeight: FontWeight.w400,
              )
            : icon,
      ),
    );
  }
}
