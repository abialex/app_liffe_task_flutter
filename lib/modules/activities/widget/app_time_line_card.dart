import 'package:app_liffe_task_flutter/common/constants/app_const_colors.dart';
import 'package:app_liffe_task_flutter/common/constants/app_const_icons.dart';
import 'package:app_liffe_task_flutter/common/constants/app_enum_spacing.dart';
import 'package:app_liffe_task_flutter/common/widget/app_box.dart';
import 'package:app_liffe_task_flutter/common/widget/app_card.dart';
import 'package:app_liffe_task_flutter/common/widget/app_text_style/app_text_style_mobile.dart';
import 'package:app_liffe_task_flutter/modules/activities/widget/app_button_dark.dart';
import 'package:app_liffe_task_flutter/modules/activities/widget/app_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TimelineItem extends StatelessWidget {
  final String time;
  final String title;
  final String duration;
  final String location;
  final int spotsAvailable;
  final double price;
  final double height;
  final List<AppLabel> labels;

  const TimelineItem({
    super.key,
    required this.time,
    required this.title,
    required this.location,
    required this.labels,
    required this.duration,
    required this.spotsAvailable,
    required this.price,
    this.height = 130,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSpacingEnum.extraSmall.size),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomPaint(
            size: Size(1.5, height),
            painter: DashedLinePainter(colorLine: AppConstColors.grey300),
          ),
          AppBox.w16,
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: AppSpacingEnum.small.size),
              child: AppCard(
                backgroundColor: AppConstColors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        AppConstTextMobile.body2(text: time),
                        AppBox.w4,
                        AppConstTextMobile.body2(text: '($duration min)', color: AppConstColors.grey500),
                      ],
                    ),
                    AppBox.h4,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppConstTextMobile.body1(text: title, fontWeight: FontWeight.w700),
                        AppConstTextMobile.body1(text: '${price.toStringAsFixed(0)}\$', fontWeight: FontWeight.w700),
                      ],
                    ),
                    AppBox.h4,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  AppConstIcons.map_svg,
                                  height: 16,
                                ),
                                AppBox.w4,
                                AppConstTextMobile.body2(text: location, color: AppConstColors.grey500)
                              ],
                            ),
                            AppBox.h8,
                            Wrap(
                              children: List.generate(
                                1,
                                (index) {
                                  return AppLabel(
                                    backgroundColor: AppConstColors.grey200,
                                    textColor: AppConstColors.grey500,
                                    suffixIcon: SvgPicture.asset(
                                      AppConstIcons.user,
                                      height: 10,
                                    ),
                                    text: '$spotsAvailable spots left',
                                  );
                                },
                              )..addAll(labels),
                            ),
                            // Row(
                            //   children: [
                            //     AppLabel(
                            //       backgroundColor: AppConstColors.grey200,
                            //       textColor: AppConstColors.grey500,
                            //       suffixIcon: SvgPicture.asset(
                            //         AppConstIcons.user,
                            //         height: 10,
                            //       ),
                            //       text: '8 spots left',
                            //     ),
                            //     AppLabel(
                            //       backgroundColor: AppConstColors.grey200,
                            //       textColor: AppConstColors.grey500,
                            //       suffixIcon: SvgPicture.asset(
                            //         AppConstIcons.user,
                            //         height: 10,
                            //       ),
                            //       text: '8 spots left',
                            //     )
                            //   ],
                            // ),
                          ],
                        ),
                        AppButtonDark(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppSpacingEnum.medium.size,
                            vertical: AppSpacingEnum.small.size,
                          ),
                          enable: spotsAvailable != 0,
                          onTap: () {},
                          text: spotsAvailable != 0 ? "Join" : "Sould out",
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DashedLinePainter extends CustomPainter {
  final Color colorLine;

  DashedLinePainter({super.repaint, required this.colorLine});
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = colorLine
      ..strokeWidth = size.width
      ..style = PaintingStyle.stroke;

    double dashHeight = 5;
    double dashSpace = 3;
    double startY = 0;

    while (startY < size.height) {
      canvas.drawLine(
        Offset(0, startY),
        Offset(0, startY + dashHeight),
        paint,
      );
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
