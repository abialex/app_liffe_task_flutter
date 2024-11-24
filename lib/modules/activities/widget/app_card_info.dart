import 'package:app_liffe_task_flutter/common/constants/app_const_colors.dart';
import 'package:app_liffe_task_flutter/common/widget/app_box.dart';
import 'package:app_liffe_task_flutter/common/widget/app_card.dart';
import 'package:app_liffe_task_flutter/common/widget/app_text_style/app_text_style_mobile.dart';
import 'package:app_liffe_task_flutter/modules/activities/widget/app_button_dark.dart';
import 'package:flutter/material.dart';

class AppCardInfo extends StatelessWidget {
  const AppCardInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      backgroundColor: AppConstColors.blue200,
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AppConstTextMobile.subtitle1(text: "You' close to your goal!", maxLines: 2),
                AppConstTextMobile.body2(
                  text: "Join more sport activities to collect more points",
                  fontWeight: FontWeight.w400,
                  maxLines: 2,
                ),
                AppBox.h8,
                Row(
                  children: [
                    AppButtonDark(onTap: () {}, text: 'Join now'),
                    AppBox.w8,
                    AppButtonDark(onTap: () {}, text: 'My points'),
                  ],
                )
              ],
            ),
          ),
          AppBox.w4,
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                const SizedBox(
                  width: 55,
                  height: 55,
                  child: CircularProgressIndicator(
                    value: 0.5,
                    color: AppConstColors.blue600,
                    backgroundColor: AppConstColors.white,
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  child: AppConstTextMobile.heading1(
                    text: '27',
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
