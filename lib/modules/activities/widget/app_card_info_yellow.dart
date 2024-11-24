import 'package:app_liffe_task_flutter/common/constants/app_const_colors.dart';
import 'package:app_liffe_task_flutter/common/constants/app_const_icons.dart';
import 'package:app_liffe_task_flutter/common/constants/app_enum_radius.dart';
import 'package:app_liffe_task_flutter/common/constants/app_enum_spacing.dart';
import 'package:app_liffe_task_flutter/common/utils/app_style_shadow.dart';
import 'package:app_liffe_task_flutter/common/widget/app_box.dart';
import 'package:app_liffe_task_flutter/common/widget/app_card.dart';
import 'package:app_liffe_task_flutter/common/widget/app_text_style/app_text_style_desktop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppCardInfoYellow extends StatelessWidget {
  const AppCardInfoYellow({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      withShadow: false,
      backgroundColor: AppConstColors.yellow200,
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AppBox.h32,
                Row(
                  children: [
                    Expanded(flex: 2, child: AppConstTextDesktop.subtitle2(text: "Weekly workshops for kids", maxLines: 3)),
                    const Spacer()
                  ],
                ),
                AppConstTextDesktop.body3(
                  text: "Sign up for early access to weekly activities for your kids full of learning and fun!",
                  maxLines: 3,
                ),
                AppBox.h8,
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSpacingEnum.extraSmall.size,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppBorderRadiusEnum.small.radius),
                        color: AppConstColors.white,
                        boxShadow: [ShadowStyles.primaryShadow]),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: AppSpacingEnum.small.size, vertical: AppSpacingEnum.extraSmall.size),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppConstTextDesktop.body2(text: 'Learn more'),
                          SvgPicture.asset(
                            AppConstIcons.arrow_right_circle_svg,
                            height: 24,
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
