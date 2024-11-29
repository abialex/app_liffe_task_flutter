// ignore_for_file: lines_longer_than_80_chars, inference_failure_on_function_return_type, sort_constructors_first

import 'package:app_liffe_task_flutter/common/constants/app_const_colors.dart';
import 'package:app_liffe_task_flutter/common/constants/app_const_icons.dart';
import 'package:app_liffe_task_flutter/common/widget/bottom_bar_image.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBarCommon extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavigationBarCommon({
    required this.selectedIndex,
    required this.onItemTapped,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: AppConstColors.white,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      // enableFeedback: false,
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: AppConstColors.dark,
      iconSize: 25,
      selectedLabelStyle: const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.bold,
        color: AppConstColors.dark,
      ),
      unselectedLabelStyle: const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.normal,
        color: Colors.deepOrangeAccent,
      ),
      selectedItemColor: AppConstColors.childCare,
      useLegacyColorScheme: true,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: BottonBarImage(
            selectedIndex: selectedIndex,
            index: 0,
            image: AppConstIcons.menu_calendar_svg,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: BottonBarImage(
            selectedIndex: selectedIndex,
            index: 1,
            image: AppConstIcons.menu_map_svg,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: BottonBarImage(
            selectedIndex: selectedIndex,
            index: 2,
            image: AppConstIcons.menu_plus_svg,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: BottonBarImage(
            selectedIndex: selectedIndex,
            index: 3,
            image: AppConstIcons.menu_users_svg,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: BottonBarImage(
            selectedIndex: selectedIndex,
            index: 4,
            image: AppConstIcons.menu_star_svg,
          ),
          label: '',
        ),
      ],
      currentIndex: selectedIndex,
      onTap: onItemTapped,
    );
  }
}
