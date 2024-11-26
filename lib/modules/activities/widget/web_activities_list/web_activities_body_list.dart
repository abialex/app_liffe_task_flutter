import 'package:app_liffe_task_flutter/common/constants/app_const_colors.dart';
import 'package:app_liffe_task_flutter/common/constants/app_const_icons.dart';
import 'package:app_liffe_task_flutter/common/constants/app_const_index.dart';
import 'package:app_liffe_task_flutter/common/constants/app_enum_difficulty_activity.dart';
import 'package:app_liffe_task_flutter/common/constants/app_enum_spacing.dart';
import 'package:app_liffe_task_flutter/common/cubit/dialog_alert_cubit/dialog_alert_cubit.dart';
import 'package:app_liffe_task_flutter/common/widget/app_box.dart';
import 'package:app_liffe_task_flutter/common/widget/app_text_style/app_text_style_mobile.dart';
import 'package:app_liffe_task_flutter/modules/activities/model/activity_data_model.dart';
import 'package:app_liffe_task_flutter/modules/activities/widget/app_card_info_event_with_background_image.dart';
import 'package:app_liffe_task_flutter/modules/activities/widget/app_card_info_yellow.dart';
import 'package:app_liffe_task_flutter/modules/activities/widget/app_time_line_card.dart';
import 'package:app_liffe_task_flutter/database/data.dart';
import 'package:app_liffe_task_flutter/modules/activities/cubit/category_selected/category_selected_cubit.dart';
import 'package:app_liffe_task_flutter/modules/activities/model/category_data_model.dart';
import 'package:app_liffe_task_flutter/modules/activities/widget/app_button_category.dart';
import 'package:app_liffe_task_flutter/modules/activities/widget/app_card_info.dart';
import 'package:app_liffe_task_flutter/modules/activities/widget/app_label.dart';
import 'package:app_liffe_task_flutter/modules/activities/widget/mobile_acitivities_list/app_input_text_form_mobile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class WebActivitiesBodyList extends StatelessWidget {
  const WebActivitiesBodyList({super.key});

  @override
  Widget build(BuildContext context) {
    final categorySelecteCubit = context.read<CategorySelectedCubit>();
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppConstTextMobile.body3(text: 'Tues, Nov 12', color: AppConstColors.grey500),
              AppBox.h4,
              AppConstTextMobile.heading1(text: 'This week in Estepona'),
              AppBox.h12,
              AppInputTextFormMobile(
                controller: TextEditingController(),
                keyboardType: TextInputType.text,
                placeholder: 'What do you feel like doing?',
                suffixIcon: Padding(
                  padding: EdgeInsets.only(right: AppSpacingEnum.medium.size),
                  child: SvgPicture.asset(
                    AppConstIcons.search_svg,
                    height: 24,
                  ),
                ),
              ),
              AppBox.h16,
              Row(
                children: [
                  AppButtonCategory(
                    onTap: () {},
                    icon: SvgPicture.asset(
                      AppConstIcons.filter_svg,
                      height: 20,
                    ),
                    isSelected: false,
                  ),
                  AppBox.w4,
                  Expanded(
                    child: BlocBuilder<CategorySelectedCubit, CategoryDataModel?>(
                      builder: (context, state) {
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                              categoryDataList.length,
                              (index) {
                                final item = categoryDataList[index];
                                return Padding(
                                  padding: EdgeInsets.symmetric(horizontal: AppSpacingEnum.extraSmall.size),
                                  child: AppButtonCategory(
                                    onTap: () {
                                      if (categorySelecteCubit.getSelected()?.id != item.id) {
                                        categorySelecteCubit.setSelected(item);
                                      } else {
                                        // categorySelecteCubit.reset();
                                      }
                                    },
                                    isSelected: state?.id == item.id,
                                    text: item.name,
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              AppBox.h16,
              Row(
                children: [
                  const CircleAvatar(
                    backgroundColor: AppConstColors.yellow300,
                    radius: 5,
                  ),
                  AppBox.w12,
                  AppConstTextMobile.subtitle2(text: 'Today'),
                  AppConstTextMobile.heading2(text: ' / tuesday', color: AppConstColors.grey500)
                ],
              ),
              Expanded(
                child: BlocBuilder<CategorySelectedCubit, CategoryDataModel?>(
                  builder: (context, state) {
                    late List<ActivityDataModel> activitiesByCategoryId;
                    if (state?.id == AppConstIndex.categoryIdAll) {
                      activitiesByCategoryId = activities;
                    } else {
                      activitiesByCategoryId = activities.where((element) => element.categoryId == state?.id).toList();
                    }
                    return ListView.builder(
                      itemCount: activitiesByCategoryId.length,
                      itemBuilder: (context, index) {
                        final item = activitiesByCategoryId[index];
                        return TimelineItem(
                          onTap: () {
                            context.read<DialogAlertCubit>().showCustomAlert(
                                  icon: AppConstIcons.user_group_svg,
                                  titulo: activitiesByCategoryId[index].title,
                                  texto:
                                      'Do you want to join the ${activitiesByCategoryId[index].title} in the ${activitiesByCategoryId[index].location}?',
                                  onAceptar: () {},
                                  onCancelar: () {},
                                );
                          },
                          time: item.time,
                          title: item.title,
                          duration: item.duration,
                          location: item.location,
                          price: item.price,
                          spotsAvailable: item.spotsAvailable,
                          labels: item.dificultys
                              .map(
                                (e) => AppLabel(
                                  backgroundColor: e.colorBackground,
                                  textColor: e.colorText,
                                  text: e.name,
                                ),
                              )
                              .toList(),
                        );
                      },
                    );
                  },
                ),
              ),

              // const TimelineItem(
              //   time: "08:00",
              //   title: "Beach Volleyball",
              //   subtitle: "La Playa",
              // ),
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSpacingEnum.large.size, vertical: AppSpacingEnum.medium.size),
              child: Column(
                children: [
                  const AppCardInfo(),
                  AppBox.h28,
                  const AppCardInfoYellow(),
                  AppBox.h28,
                  const AppCardInfoEventWithBackgroundImage()
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
