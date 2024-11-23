import 'package:app_liffe_task_flutter/common/constants/app_const_colors.dart';
import 'package:app_liffe_task_flutter/common/constants/app_enum_radius.dart';
import 'package:app_liffe_task_flutter/common/constants/app_enum_spacing.dart';
import 'package:app_liffe_task_flutter/common/utils/app_style_shadow.dart';
import 'package:app_liffe_task_flutter/common/widget/app_text_style/app_text_style_mobile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppInputTextFormMobile extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLines;
  final int? minLines;
  final bool? enable;
  final String placeholder;
  final AppSpacingEnum? verticalPaddingEnum;
  final AppSpacingEnum? leftPaddingEnum;
  final AppSpacingEnum? rightPaddingEnum;
  final bool hasError;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  const AppInputTextFormMobile({
    super.key,
    required this.controller,
    required this.keyboardType,
    this.inputFormatters,
    this.maxLines = 1,
    this.minLines,
    this.enable = true,
    required this.placeholder,
    this.verticalPaddingEnum,
    this.leftPaddingEnum,
    this.rightPaddingEnum,
    this.hasError = false,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        ShadowStyles.inputShadow,
      ]),
      child: TextFormField(
        style: AppConstTextMobile.body1(text: '').style!,
        controller: controller,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        maxLines: maxLines,
        minLines: minLines,
        enabled: enable,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          suffixIconConstraints: const BoxConstraints(),
          prefixIconConstraints: const BoxConstraints(),
          contentPadding: EdgeInsets.only(
            bottom: verticalPaddingEnum?.size ?? AppSpacingEnum.small.size,
            left: leftPaddingEnum?.size ?? AppSpacingEnum.small.size,
            right: rightPaddingEnum?.size ?? AppSpacingEnum.small.size,
            top: verticalPaddingEnum?.size ?? AppSpacingEnum.small.size,
          ),
          hintText: placeholder,
          hintStyle: AppConstTextMobile.body1(text: '', color: AppConstColors.grey500).style!,
          isDense: true,
          filled: true,
          fillColor: (enable ?? true) ? AppConstColors.white : AppConstColors.grey200,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(AppBorderRadiusEnum.small.radius)),
            borderSide: BorderSide(
              color: hasError ? AppConstColors.highIntensity : AppConstColors.grey100,
              width: 0.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(AppBorderRadiusEnum.small.radius)),
            borderSide: const BorderSide(color: AppConstColors.blue500),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(AppBorderRadiusEnum.small.radius)),
            borderSide: const BorderSide(color: AppConstColors.dark),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(AppBorderRadiusEnum.small.radius)),
            borderSide: const BorderSide(color: AppConstColors.dark),
          ),
        ),
        onChanged: (value) {
          // Aquí puedes manejar el evento de cambio si es necesario
        },
      ),
    );
  }

  static BorderRadius getBorderRadius({Widget? suffixIcon, Widget? prefixIcon}) {
    if (suffixIcon != null && prefixIcon != null) {
      return BorderRadius.horizontal(
        left: Radius.circular(AppBorderRadiusEnum.small.radius),
        right: Radius.circular(AppBorderRadiusEnum.small.radius),
      );
    }
    if (suffixIcon != null) {
      return BorderRadius.horizontal(left: Radius.circular(AppBorderRadiusEnum.small.radius));
    }
    if (prefixIcon != null) {
      return BorderRadius.horizontal(right: Radius.circular(AppBorderRadiusEnum.small.radius));
    }
    return BorderRadius.horizontal(
      left: Radius.circular(AppBorderRadiusEnum.small.radius),
      right: Radius.circular(AppBorderRadiusEnum.small.radius),
    );
  }
}
