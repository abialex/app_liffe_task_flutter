import 'package:app_liffe_task_flutter/common/constants/app_const_index.dart';
import 'package:app_liffe_task_flutter/common/cubit/dialog_alert_cubit/dialog_alert_cubit.dart';
import 'package:app_liffe_task_flutter/common/widget/app_body_base/app_body_base_mobile.dart';
import 'package:app_liffe_task_flutter/common/widget/app_body_base/app_body_base_web.dart';
import 'package:app_liffe_task_flutter/common/widget/app_responsive_base.dart';
import 'package:app_liffe_task_flutter/modules/activities/bloc/activities_list_bloc/activities_list_bloc.dart';
import 'package:app_liffe_task_flutter/modules/activities/cubit/category_selected/category_selected_cubit.dart';
import 'package:app_liffe_task_flutter/modules/activities/model/category_data_model.dart';
import 'package:app_liffe_task_flutter/modules/activities/widget/mobile_acitivities_list/mobile_activities_body_list.dart';
import 'package:app_liffe_task_flutter/modules/activities/widget/mobile_acitivities_list/mobile_activities_header_list.dart';
import 'package:app_liffe_task_flutter/modules/activities/widget/web_activities_list/web_activities_body_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActivitiesListPage extends StatelessWidget {
  const ActivitiesListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CategorySelectedCubit(categoryIdInit: AppConstIndex.categoryIdAll),
        ),
        BlocProvider(
          create: (context) => ActivitiesListBloc(),
        ),
      ],
      child: Builder(builder: (context) {
        return MultiBlocListener(
          listeners: [
            BlocListener<ActivitiesListBloc, ActivitiesListState>(
              bloc: context.read<ActivitiesListBloc>()..add(const ActivitiesListEvent.getActivities()),
              listener: (context, state) {
                state.mapOrNull(
                  error: (value) {
                    context.read<DialogAlertCubit>().showErrorAlert(
                          titulo: 'Error',
                          texto: value.failure,
                        );
                  },
                );
              },
            ),
            BlocListener<CategorySelectedCubit, CategoryDataModel?>(
              listener: (context, state) {
                context.read<ActivitiesListBloc>().add(ActivitiesListEvent.getActivitiesByCategoryId(state?.id));
              },
            ),
          ],
          child: AppResponsiveBase(
            mobile: const AppBodyBaseMobile(
              headerWidget: MobileActivitiesHeaderList(),
              bodyWidget: MobileActivitiesBodyList(),
              // footerWidget: MobileActivitiesFooterList(),
            ),
            web: const AppBodyBaseWeb(
              bodyWidget: WebActivitiesBodyList(),
            ),
          ),
        );
      }),
    );
  }
}
