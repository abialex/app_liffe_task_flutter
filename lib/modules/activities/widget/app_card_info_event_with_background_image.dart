import 'package:app_liffe_task_flutter/common/constants/app_const_colors.dart';
import 'package:app_liffe_task_flutter/common/constants/app_const_images.dart';
import 'package:app_liffe_task_flutter/common/constants/app_enum_radius.dart';
import 'package:app_liffe_task_flutter/common/constants/app_enum_spacing.dart';
import 'package:app_liffe_task_flutter/common/widget/app_box.dart';
import 'package:app_liffe_task_flutter/common/widget/app_card.dart';
import 'package:app_liffe_task_flutter/common/widget/app_text_style/app_text_style_desktop.dart';
import 'package:flutter/material.dart';

class AppCardInfoEventWithBackgroundImage extends StatelessWidget {
  const AppCardInfoEventWithBackgroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      withShadow: false,
      imageBackground: AppConstImages.background_card_event,
      backgroundColor: AppConstColors.yellow200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppBox.h8,
          AppConstTextDesktop.subtitle1(
            text: "Popular events near you!",
            maxLines: 2,
            color: AppConstColors.white,
            textAlign: TextAlign.left,
          ),
          AppBox.h100,
          AppConstTextDesktop.body3(
            text: "Unleash the fun! Explore the world of exciting events happening near you.",
            maxLines: 2,
            color: AppConstColors.white,
          ),
          AppBox.h16,
          Container(
            margin: EdgeInsets.symmetric(horizontal: AppSpacingEnum.extraLarge.size),
            padding: EdgeInsets.symmetric(vertical: AppSpacingEnum.extraSmall.size),
            decoration: BoxDecoration(
              color: AppConstColors.white,
              borderRadius: BorderRadius.circular(AppBorderRadiusEnum.small.radius),
            ),
            child: AppConstTextDesktop.body1(
              text: "See more",
              maxLines: 2,
              textAlign: TextAlign.center,
              fontSize: 16,
            ),
          )
        ],
      ),
    );
  }
}
