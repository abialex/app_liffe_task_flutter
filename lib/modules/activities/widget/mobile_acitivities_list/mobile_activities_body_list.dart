import 'package:app_liffe_task_flutter/common/constants/app_const_colors.dart';
import 'package:app_liffe_task_flutter/common/constants/app_const_icons.dart';
import 'package:app_liffe_task_flutter/common/constants/app_const_index.dart';
import 'package:app_liffe_task_flutter/common/constants/app_enum_difficulty_activity.dart';
import 'package:app_liffe_task_flutter/common/constants/app_enum_spacing.dart';
import 'package:app_liffe_task_flutter/common/widget/app_box.dart';
import 'package:app_liffe_task_flutter/common/widget/app_text_style/app_text_style_mobile.dart';
import 'package:app_liffe_task_flutter/modules/activities/model/activity_data_model.dart';
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

class MobileActivitiesBodyList extends StatelessWidget {
  const MobileActivitiesBodyList({super.key});

  @override
  Widget build(BuildContext context) {
    final categorySelecteCubit = context.read<CategorySelectedCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppConstTextMobile.heading2(text: 'This week in Estepona'),
        AppBox.h16,
        const AppCardInfo(),
        AppBox.h16,
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
            AppConstTextMobile.subtitle1(text: 'Today'),
            AppConstTextMobile.body2(text: ' / tuesday', color: AppConstColors.grey500)
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
    );
  }
}
