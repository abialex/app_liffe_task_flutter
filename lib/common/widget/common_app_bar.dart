// ignore_for_file: must_be_immutable, lines_longer_than_80_chars

import 'package:app_liffe_task_flutter/common/constants/app_const_colors.dart';
import 'package:app_liffe_task_flutter/common/constants/app_const_icons.dart';
import 'package:app_liffe_task_flutter/common/widget/app_box.dart';
import 'package:app_liffe_task_flutter/common/widget/app_text_style/app_text_style_mobile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CommonAppBar extends StatelessWidget {
  CommonAppBar({
    required this.isVisibleBack,
    required this.title,
    required this.isvisibleTitleWithOptions,
    required this.height,
    this.iconTitle,
    this.isVisibleTitleIcon = true,
    this.isVisibleNotificationIcon = true,
    this.isVisibleMenuIcon = true,
    this.onTap,
    this.widgetCenterCustom,
    super.key,
  });

  final bool isVisibleBack;
  String? iconTitle;
  final String title;
  void Function()? onTap;
  final bool isVisibleTitleIcon;
  bool isvisibleTitleWithOptions;
  bool isVisibleNotificationIcon;
  bool isVisibleMenuIcon;
  Widget? widgetCenterCustom;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Stack(
        children: [
          Align(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                widgetCenterCustom ??
                    Visibility(
                      visible: isvisibleTitleWithOptions,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Visibility(
                            visible: isVisibleTitleIcon,
                            child: Row(
                              children: [
                                if (iconTitle != null)
                                  Image.asset(
                                    iconTitle!,
                                    height: 25,
                                    color: Colors.white,
                                  ),
                                const SizedBox(
                                  width: 5,
                                ),
                              ],
                            ),
                          ),
                          AppConstTextMobile.body2(text: title, color: AppConstColors.white, fontWeight: FontWeight.w500),
                        ],
                      ),
                    ),
              ],
            ),
          ),
          Positioned(
            right: 5,
            top: 12.5,
            child: Visibility(
              visible: isvisibleTitleWithOptions,
              child: Row(
                children: [
                  Visibility(
                    visible: isVisibleNotificationIcon,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        AppConstIcons.notification_svg,
                        fit: BoxFit.fitHeight,
                        width: 20,
                        height: 20,
                      ),
                    ),
                  ),
                  AppBox.w4,
                  Visibility(
                    visible: isVisibleMenuIcon,
                    child: Row(
                      children: [
                        const SizedBox(),
                        IconButton(
                          constraints: const BoxConstraints(),
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            // Navigator.pushNamed(context, RoutesApp.menuHome);
                          },
                          icon: const Icon(Icons.menu, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 5,
            top: 12.5,
            child: Visibility(
              visible: isVisibleBack,
              child: Row(
                children: [
                  IconButton(
                    constraints: const BoxConstraints(),
                    padding: EdgeInsets.zero,
                    icon: Image.asset(AppConstIcons.notification_svg, scale: 3.5),
                    onPressed: onTap,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
