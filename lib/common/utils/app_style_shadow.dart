// lib/core/theme/shadow_styles.dart

import 'package:app_liffe_task_flutter/common/constants/app_const_colors.dart';
import 'package:flutter/material.dart';

class ShadowStyles {
  static BoxShadow primaryShadow = BoxShadow(
    color: AppConstColors.dark.withOpacity(0.2),
    blurRadius: 8,
    offset: const Offset(3, 3),
  );

  static BoxShadow inputShadow = BoxShadow(
    color: AppConstColors.dark.withOpacity(0.2),
    blurRadius: 8,
    offset: const Offset(3, 3),
  );
}
