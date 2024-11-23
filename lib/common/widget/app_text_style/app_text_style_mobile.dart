import 'package:app_liffe_task_flutter/common/constants/app_const_colors.dart';
import 'package:flutter/material.dart';

class AppConstTextMobile {
  // Bold Body Text Style
  static Text bodyBold3({
    required String text,
    double? fontSize,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
  }) {
    return Text(
      text,
      maxLines: maxLines ?? 1,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize ?? 10,
        color: color ?? AppConstColors.dark,
        fontWeight: FontWeight.w700,
      ),
      overflow: TextOverflow.ellipsis,
    );
  }

  // Regular Body Text Styles
  static Text body3({
    required String text,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
  }) {
    return Text(
      text,
      softWrap: true,
      maxLines: maxLines ?? 1,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: 10,
        color: color ?? AppConstColors.dark,
        fontWeight: FontWeight.w500,
      ),
      overflow: TextOverflow.ellipsis,
    );
  }

  static Text body2({
    required String text,
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
    TextAlign? textAlign,
    int? maxLines,
  }) {
    return Text(
      text,
      textAlign: textAlign,
      softWrap: true,
      maxLines: maxLines ?? 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: fontSize ?? 12,
        color: color ?? AppConstColors.dark,
        fontWeight: fontWeight ?? FontWeight.w500,
      ),
    );
  }

  static Text body1({
    required String text,
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
    TextAlign? textAlign,
    int? maxLines,
  }) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines ?? 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: fontSize ?? 14,
        color: color ?? AppConstColors.dark,
        fontWeight: fontWeight ?? FontWeight.w500,
      ),
    );
  }

  // Subtitle Text Styles
  static Text subtitle2({
    required String text,
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
    TextAlign? textAlign,
    int? maxLines,
  }) {
    //inter
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines ?? 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: fontSize ?? 20,
        color: color ?? AppConstColors.dark,
        fontWeight: fontWeight ?? FontWeight.w700,
      ),
    );
  }

  static Text subtitle1({
    required String text,
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
    TextAlign? textAlign,
    int? maxLines,
  }) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines ?? 1,
      softWrap: true,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: fontSize ?? 16,
        color: color ?? AppConstColors.dark,
        fontWeight: fontWeight ?? FontWeight.w500,
      ),
    );
  }

  // Heading Text Styles
  static Text heading2({
    required String text,
    Color? color,
    FontWeight? fontWeight,
    TextAlign? textAlign,
    int? maxLines,
  }) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines ?? 1,
      softWrap: true,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 20,
        color: color ?? AppConstColors.dark,
        fontWeight: fontWeight ?? FontWeight.w500,
      ),
    );
  }

  static Text heading1({
    required String text,
    Color? color,
    FontWeight? fontWeight,
    TextAlign? textAlign,
    int? maxLines,
  }) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines ?? 1,
      softWrap: true,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 24,
        color: color ?? AppConstColors.dark,
        fontWeight: fontWeight ?? FontWeight.w700,
      ),
    );
  }
}
