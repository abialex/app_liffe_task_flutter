// ignore_for_file: lines_longer_than_80_chars, deprecated_member_use

import 'package:app_liffe_task_flutter/common/constants/app_const_colors.dart';
import 'package:app_liffe_task_flutter/common/constants/app_const_index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottonBarImage extends StatelessWidget {
  const BottonBarImage({
    required this.selectedIndex,
    required this.index,
    required this.image,
    super.key,
  });

  final int selectedIndex;
  final int index;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: SvgPicture.asset(
        image,
        fit: BoxFit.fitHeight,
        width: 25,
        height: 25,
        color: selectedIndex == index && index != AppConstIndex.indexAddActivity ? AppConstColors.blue600 : null,
      ),
    );
  }
}
