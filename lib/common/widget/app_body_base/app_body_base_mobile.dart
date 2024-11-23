// ignore_for_file: lines_longer_than_80_chars

import 'package:app_liffe_task_flutter/common/constants/app_const_colors.dart';
import 'package:app_liffe_task_flutter/common/constants/app_enum_spacing.dart';
import 'package:app_liffe_task_flutter/common/widget/app_box.dart';
import 'package:flutter/material.dart';

class AppBodyBaseMobile extends StatelessWidget {
  const AppBodyBaseMobile({
    super.key,
    this.headerWidget,
    this.bodyWidget,
    this.footerWidget,
  });
  final Widget? headerWidget;
  final Widget? bodyWidget;
  final Widget? footerWidget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstColors.grey100,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSpacingEnum.medium.size),
        child: Column(
          children: [
            AppBox.h52,
            if (headerWidget == null) const SizedBox.shrink() else headerWidget!,
            if (bodyWidget == null) const SizedBox.shrink() else Expanded(child: bodyWidget!),
            if (footerWidget == null) const SizedBox.shrink() else footerWidget!,
          ],
        ),
      ),
    );
  }
}
