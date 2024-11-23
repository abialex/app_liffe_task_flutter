import 'dart:async';

import 'package:app_liffe_task_flutter/common/widget/app_body_base/app_body_base_mobile.dart';
import 'package:app_liffe_task_flutter/common/widget/app_body_base/app_body_base_web.dart';
import 'package:app_liffe_task_flutter/common/widget/app_responsive_base.dart';
import 'package:app_liffe_task_flutter/config/app_routes.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final durationSplash = 2;

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: durationSplash), () {
      Navigator.of(context).pushReplacementNamed(RoutesApp.activitiesList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppResponsiveBase(
      mobile: const AppBodyBaseMobile(
        headerWidget: Text("data"),
      ),
      web: const AppBodyBaseWeb(
        footerWidget: Text("soy la otra data web"),
      ),
    );
  }
}
