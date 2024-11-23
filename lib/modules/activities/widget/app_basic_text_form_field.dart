// ignore_for_file: lines_longer_than_80_chars

import 'package:app_liffe_task_flutter/common/constants/app_const_colors.dart';
import 'package:app_liffe_task_flutter/common/constants/app_enum_radius.dart';
import 'package:app_liffe_task_flutter/common/constants/app_enum_spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppInputBasicTextFormFiel<T> extends FormField<T> {
  AppInputBasicTextFormFiel({
    required this.onChanged,
    required this.validatorParent,
    required this.placeholder,
    required this.controller,
    required this.keyboardType,
    required this.inputFormatters,
    this.enable,
    this.suffixIcon,
    this.prefixIcon,
    this.maxLines,
    this.minLines,
    this.padding,
    this.verticalPaddingEnum,
    this.leftPaddingEnum,
    this.rightPaddingEnum,
    super.key,
  }) : super(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: validatorParent,
          builder: (FormFieldState<T> state) {
            return Padding(
              padding: padding ??
                  EdgeInsets.symmetric(
                    vertical: AppSpacingEnum.extraSmall.size,
                    horizontal: AppSpacingEnum.small.size,
                  ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppBorderRadiusEnum.small.radius),
                      // border: state.hasError ? Border.all(color: AppConstColors.redAccent) : null,
                    ),
                    child: IntrinsicHeight(
                      child: Row(
                        children: [
                          if (prefixIcon != null) ...[
                            Container(
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: AppConstColors.blue600,
                                borderRadius: BorderRadius.horizontal(left: Radius.circular(AppBorderRadiusEnum.small.radius)),
                              ),
                              child: prefixIcon,
                            ),
                            // AppBox.w(0.25),
                          ],
                          Expanded(
                            child: TextFormField(
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: AppConstColors.dark,
                              ),
                              controller: controller,
                              keyboardType: keyboardType,
                              inputFormatters: inputFormatters,
                              maxLines: maxLines,
                              minLines: minLines,
                              enabled: enable,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(
                                  bottom: verticalPaddingEnum?.size ?? AppSpacingEnum.small.size,
                                  left: leftPaddingEnum?.size ?? AppSpacingEnum.small.size,
                                  right: rightPaddingEnum?.size ?? AppSpacingEnum.small.size,
                                  top: verticalPaddingEnum?.size ?? AppSpacingEnum.small.size,
                                ),
                                hintText: placeholder,
                                hintStyle: const TextStyle(fontSize: 12),
                                isDense: true,
                                filled: true,
                                fillColor: (enable ?? true) ? AppConstColors.white : AppConstColors.grey200,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: getBorderRadius(prefixIcon: prefixIcon, suffixIcon: suffixIcon),
                                  borderSide: BorderSide(
                                    color: state.hasError ? AppConstColors.highIntensity : AppConstColors.grey100,
                                    width: 0.5,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: getBorderRadius(prefixIcon: prefixIcon, suffixIcon: suffixIcon),
                                  borderSide: const BorderSide(color: AppConstColors.blue500),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: getBorderRadius(prefixIcon: prefixIcon, suffixIcon: suffixIcon),
                                  borderSide: const BorderSide(color: AppConstColors.dark),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: getBorderRadius(prefixIcon: prefixIcon, suffixIcon: suffixIcon),
                                  borderSide: const BorderSide(color: AppConstColors.dark),
                                ),
                              ),
                              onChanged: (value) {
                                onChanged?.call(value as T);
                                state.didChange(value as T);
                              },
                            ),
                          ),
                          if (suffixIcon != null) ...[
                            // AppBox.w(0.25),
                            suffixIcon,
                          ],
                        ],
                      ),
                    ),
                  ),
                  if (state.hasError)
                    Padding(
                      padding: const EdgeInsets.only(top: 5, left: 11),
                      child: Text(
                        state.errorText!,
                        style: const TextStyle(color: AppConstColors.lightIntensity, fontSize: 12),
                      ),
                    ),
                ],
              ),
            );
          },
        );

  final String? placeholder;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool? enable;
  final int? maxLines;
  final int? minLines;
  final EdgeInsets? padding;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final void Function(T value)? onChanged;
  final String? Function(T?)? validatorParent;
  final AppSpacingEnum? verticalPaddingEnum;
  final AppSpacingEnum? leftPaddingEnum;
  final AppSpacingEnum? rightPaddingEnum;

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
