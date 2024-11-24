import 'package:app_liffe_task_flutter/common/widget/app_body_base/app_body_base_mobile.dart';
import 'package:app_liffe_task_flutter/common/widget/app_body_base/app_body_base_web.dart';
import 'package:app_liffe_task_flutter/common/widget/app_responsive_base.dart';
import 'package:app_liffe_task_flutter/modules/activities/cubit/category_selected/category_selected_cubit.dart';
import 'package:app_liffe_task_flutter/modules/activities/widget/mobile_acitivities_list/mobile_activities_body_list.dart';
import 'package:app_liffe_task_flutter/modules/activities/widget/mobile_acitivities_list/mobile_activities_header_list.dart';
import 'package:app_liffe_task_flutter/modules/activities/widget/web_activities_list/web_activities_body_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActivitiesListPage extends StatelessWidget {
  const ActivitiesListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategorySelectedCubit(),
      child: Builder(builder: (context) {
        return AppResponsiveBase(
          mobile: const AppBodyBaseMobile(
            headerWidget: MobileActivitiesHeaderList(),
            bodyWidget: MobileActivitiesBodyList(),
            // footerWidget: MobileActivitiesFooterList(),
          ),
          web: const AppBodyBaseWeb(
            bodyWidget: WebActivitiesBodyList(),
          ),
        );
      }),
    );
  }
}
