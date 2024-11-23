import 'package:app_liffe_task_flutter/common/constants/app_enum_radius.dart';
import 'package:app_liffe_task_flutter/common/constants/app_enum_spacing.dart';
import 'package:app_liffe_task_flutter/common/utils/app_style_shadow.dart';
import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  const AppCard({
    super.key,
    required this.child,
    required this.backgroundColor,
  });
  final Widget child;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppSpacingEnum.medium.size, vertical: AppSpacingEnum.medium.size),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppBorderRadiusEnum.medium.radius),
          color: backgroundColor,
          boxShadow: [ShadowStyles.primaryShadow]),
      child: child,
    );
  }
}
