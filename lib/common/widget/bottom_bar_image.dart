// ignore_for_file: lines_longer_than_80_chars, deprecated_member_use

import 'package:app_liffe_task_flutter/common/constants/app_const_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottonBarImage extends StatelessWidget {
  const BottonBarImage({
    required int selectedIndex,
    required int index,
    required String image,
    super.key,
  })  : _selectedIndex = selectedIndex,
        _index = index,
        _image = image;

  final int _selectedIndex;
  final int _index;
  final String _image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: SvgPicture.asset(
        _image,
        fit: BoxFit.fitHeight,
        width: 25,
        height: 25,
        color: _selectedIndex == _index ? AppConstColors.blue400 : AppConstColors.grey300,
      ),
    );
  }
}
