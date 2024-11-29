import 'package:app_liffe_task_flutter/common/constants/app_const_colors.dart';
import 'package:app_liffe_task_flutter/common/constants/app_const_icons.dart';
import 'package:app_liffe_task_flutter/common/constants/app_const_images.dart';
import 'package:app_liffe_task_flutter/common/constants/app_enum_radius.dart';
import 'package:app_liffe_task_flutter/common/constants/app_enum_spacing.dart';
import 'package:app_liffe_task_flutter/common/widget/app_box.dart';
import 'package:app_liffe_task_flutter/common/widget/app_text_style/app_text_style_desktop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MenuWeb extends StatelessWidget {
  const MenuWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppConstColors.dark,
      child: Column(
        children: [
          AppBox.h52,
          SvgPicture.asset(
            AppConstIcons.logo_svg,
            height: 24,
          ),
          AppBox.h44,
          _buildTap(text: 'Activities', icon: AppConstIcons.menu_calendar_svg),
          _buildTap(text: 'Locations', icon: AppConstIcons.menu_map_svg),
          _buildTap(text: 'Services', icon: AppConstIcons.menu_star_svg),
          _buildTap(text: 'Communities', icon: AppConstIcons.menu_users_svg),
          _buildTap(text: 'Notifications', icon: AppConstIcons.notification_svg),
          AppBox.h8,
          _buildButtonAdd(onTap: () {}, text: 'Create'),
          AppBox.h24,
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  AppConstImages.logo,
                  height: 28,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSpacingEnum.mediumLarge.size),
                child: AppConstTextDesktop.body1(text: 'Profile', color: AppConstColors.white),
              ),
              AppBox.w4,
              InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.more_vert,
                  color: AppConstColors.white,
                  size: 20,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildTap({required String text, required String icon}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSpacingEnum.smallMedium.size),
      child: InkWell(
        onTap: () {},
        child: Row(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: SvgPicture.asset(
                  icon,
                  height: 20,
                  color: AppConstColors.white,
                ),
              ),
            ),
            AppBox.w24,
            Expanded(
              flex: 2,
              child: AppConstTextDesktop.body1(
                text: text,
                color: AppConstColors.white,
                textAlign: TextAlign.left,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildButtonAdd({required String text, required void Function() onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: AppSpacingEnum.small.size, horizontal: AppSpacingEnum.smallMedium.size),
        decoration: BoxDecoration(
          color: AppConstColors.blue600,
          borderRadius: BorderRadius.circular(AppBorderRadiusEnum.large.radius),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.add,
              size: 20,
            ),
            AppBox.w4,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSpacingEnum.mediumLarge.size),
              child: AppConstTextDesktop.body1(text: text, fontWeight: FontWeight.w700),
            )
          ],
        ),
      ),
    );
  }
}
