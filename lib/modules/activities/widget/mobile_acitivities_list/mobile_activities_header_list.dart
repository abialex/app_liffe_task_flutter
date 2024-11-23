import 'package:app_liffe_task_flutter/common/constants/app_const_colors.dart';
import 'package:app_liffe_task_flutter/common/constants/app_const_icons.dart';
import 'package:app_liffe_task_flutter/common/constants/app_const_images.dart';
import 'package:app_liffe_task_flutter/common/widget/app_box.dart';
import 'package:app_liffe_task_flutter/common/widget/app_text_style/app_text_style_mobile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class MobileActivitiesHeaderList extends StatelessWidget {
  const MobileActivitiesHeaderList({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppConstTextMobile.body2(
          text: 'Tues, Nov 12',
          color: AppConstColors.grey500,
        ),
        Row(
          children: [
            SvgPicture.asset(
              AppConstIcons.notification_svg,
              height: 24,
            ),
            AppBox.w8,
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                AppConstImages.logo,
                height: 24,
              ),
            )
          ],
        )
      ],
    );
  }
}
