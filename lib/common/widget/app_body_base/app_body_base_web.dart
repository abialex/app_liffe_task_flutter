// ignore_for_file: lines_longer_than_80_chars

import 'package:app_liffe_task_flutter/common/constants/app_const_colors.dart';
import 'package:app_liffe_task_flutter/common/widget/app_box.dart';
import 'package:app_liffe_task_flutter/common/widget/app_menu_web.dart';
import 'package:flutter/material.dart';

class AppBodyBaseWeb extends StatelessWidget {
  const AppBodyBaseWeb({
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
      backgroundColor: AppConstColors.white,
      body: Row(
        children: [
          const SizedBox(
            width: 240,
            child: MenuWeb(),
          ),
          AppBox.w20,
          Expanded(
            flex: 4,
            child: Column(
              children: [
                AppBox.h52,
                if (headerWidget == null) const SizedBox.shrink() else headerWidget!,
                if (bodyWidget == null) const SizedBox.shrink() else Expanded(child: bodyWidget!),
                if (footerWidget == null) const SizedBox.shrink() else footerWidget!,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
