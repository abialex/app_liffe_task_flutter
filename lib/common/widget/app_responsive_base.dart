// ignore_for_file: lines_longer_than_80_chars, sort_constructors_first, use_super_parameters, prefer_const_constructors_in_immutables

import 'package:app_liffe_task_flutter/common/utils/responsive_app.dart';
import 'package:flutter/material.dart';

class AppResponsiveBase extends StatelessWidget {
  final Widget mobile;
  final Widget web;

  AppResponsiveBase({super.key, required this.mobile, required this.web});

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveApp.isLargeWeb(context) || ResponsiveApp.isMediumWeb(context);

    return isDesktop
        ? AnimatedOpacity(
            opacity: isDesktop ? 1 : 0,
            duration: const Duration(milliseconds: 300),
            child: web,
          )
        : AnimatedOpacity(
            opacity: isDesktop ? 0 : 1,
            duration: const Duration(milliseconds: 300),
            child: mobile,
          );
  }
}
