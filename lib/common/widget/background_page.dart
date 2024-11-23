// ignore_for_file: library_private_types_in_public_api, lines_longer_than_80_chars, inference_failure_on_instance_creation, must_be_immutable

import 'package:app_liffe_task_flutter/common/constants/app_const_colors.dart';
import 'package:app_liffe_task_flutter/common/cubit/navigator_cubit.dart';
import 'package:app_liffe_task_flutter/common/widget/bottom_navigation_bar_common.dart';
import 'package:app_liffe_task_flutter/common/widget/common_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BackgroundPage extends StatelessWidget {
  BackgroundPage({
    required this.child,
    required this.title,
    this.isVisibleBack = true,
    this.onTap,
    this.padding = const EdgeInsets.only(top: 10, left: 10, right: 10),
    this.iconTitle,
    this.minusHeight = 0,
    this.isVisibleTitleIcon = true,
    this.isvisibleTitleWithOptions = true,
    this.isVisibleNotificationIcon = false,
    this.isVisibleMenuIcon = true,
    this.borderRadiusValue = 10,
    this.widgetCenterCustom,
    this.isVisibleNavbar = true,
    super.key,
  });

  bool isVisibleBack;
  String title;
  Widget child;
  EdgeInsets padding;
  void Function()? onTap;
  double minusHeight;
  final String? iconTitle;
  bool isVisibleTitleIcon;
  bool isvisibleTitleWithOptions;
  double borderRadiusValue;
  bool isVisibleNotificationIcon;
  bool isVisibleMenuIcon;
  Widget? widgetCenterCustom;
  bool isVisibleNavbar;

  @override
  Widget build(BuildContext context) {
    const heightSpacing = 80;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: AppConstColors.blue600),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Icon(Icons.abc),
            ),
            //Appbar
            CommonAppBar(
              height: MediaQuery.of(context).size.height * 0.08 + minusHeight,
              isVisibleBack: isVisibleBack,
              title: title,
              onTap: onTap,
              iconTitle: iconTitle,
              isVisibleTitleIcon: isVisibleTitleIcon,
              isvisibleTitleWithOptions: isvisibleTitleWithOptions,
              isVisibleMenuIcon: isVisibleMenuIcon,
              isVisibleNotificationIcon: isVisibleNotificationIcon,
              widgetCenterCustom: widgetCenterCustom,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.89 - minusHeight - heightSpacing,
                width: MediaQuery.of(context).size.width,
                padding: padding,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(borderRadiusValue),
                    topLeft: Radius.circular(borderRadiusValue),
                  ),
                  color: AppConstColors.grey600,
                ),
                child: child,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BlocListener<NavigationCubit, NavigationState>(
        listener: (context, state) {
          Navigator.of(context).popUntil((route) => route.isFirst);
        },
        child: BlocBuilder<NavigationCubit, NavigationState>(
          builder: (context, state) {
            if (!isVisibleNavbar) {
              return const SizedBox.shrink();
            }
            return SizedBox(
              height: 70,
              child: CustomBottomNavigationBarCommon(
                selectedIndex: state.selectedIndex,
                onItemTapped: (index) => context.read<NavigationCubit>().changePage(index),
              ),
            );
          },
        ),
      ),
    );
  }
}
