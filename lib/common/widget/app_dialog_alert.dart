// ignore_for_file: lines_longer_than_80_chars

import 'package:app_liffe_task_flutter/common/constants/app_const_colors.dart';
import 'package:app_liffe_task_flutter/common/constants/app_const_icons.dart';
import 'package:app_liffe_task_flutter/common/cubit/dialog_alert_cubit/dialog_alert_cubit.dart';
import 'package:app_liffe_task_flutter/common/widget/app_box.dart';
import 'package:app_liffe_task_flutter/common/widget/app_responsive_base.dart';
import 'package:app_liffe_task_flutter/common/widget/app_text_style/app_text_style_desktop.dart';
import 'package:app_liffe_task_flutter/common/widget/app_text_style/app_text_style_mobile.dart';
import 'package:app_liffe_task_flutter/common/widget/buttons/app_button_dark.dart';
import 'package:app_liffe_task_flutter/common/widget/buttons/app_button_white.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class AppAlertDialog extends StatelessWidget {
  const AppAlertDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dialogCubit = context.read<DialogAlertCubit>();

    return BlocBuilder<DialogAlertCubit, DialogAlertState>(
      builder: (ctx, state) {
        return Visibility(
          visible: state.show,
          child: ColoredBox(
            color: AppConstColors.dark.withOpacity(0.7),
            child: Center(
              child: AppResponsiveBase(
                web: Dialog(
                  insetPadding: const EdgeInsets.symmetric(horizontal: 320),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IntrinsicWidth(
                    child: IntrinsicHeight(
                      child: Container(
                        decoration: const BoxDecoration(
                          color: AppConstColors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        // height: 320,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              //icons
                              Padding(
                                padding: const EdgeInsets.all(5),
                                child: SvgPicture.asset(
                                  state.icon ?? AppConstIcons.user_group_svg,
                                  height: 65,
                                  color: AppConstColors.dark,
                                )
                                    .animate(
                                      onPlay: (controller) => controller.loop(reverse: true),
                                    )
                                    .rotate(
                                      begin: -0.01,
                                      end: 0.01,
                                      duration: 0.7.seconds,
                                    ),
                              ),
                              AppBox.h8,
                              //body
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      AppConstTextDesktop.heading1(
                                        text: state.titulo,
                                        textAlign: TextAlign.center,
                                        fontWeight: FontWeight.bold,
                                        maxLines: 3,
                                      ),
                                    ],
                                  ),
                                  AppBox.h12,
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      AppConstTextMobile.subtitle1(
                                        text: state.texto,
                                        textAlign: TextAlign.center,
                                        maxLines: 12,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              AppBox.h32,
                              Column(
                                children: [
                                  if (state.widget != null) state.widget!,
                                  if (state.onAceptar != null)
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        if (state.onCancelar != null) ...[
                                          AppButtonWhite(
                                            text: 'Cancel',
                                            onTap: () {
                                              dialogCubit.disguiseDialog();
                                              state.onCancelar?.call();
                                            },
                                            enable: true,
                                          ),
                                          AppBox.w24,
                                        ],
                                        AppButtonDark(
                                          text: state.aceptarText ?? 'Accept',
                                          onTap: () {
                                            dialogCubit.disguiseDialog();
                                            state.onAceptar?.call();
                                          },
                                        ),
                                      ],
                                    ),
                                  if (state.onExtraAction != null)
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 2.5),
                                      child: Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              dialogCubit.disguiseDialog();
                                              state.onExtraAction?.call();
                                              state.onCancelar?.call();
                                            },
                                            child: AppConstTextMobile.body2(
                                              text: state.textExtraAction ?? 'texto por defecto defecto',
                                              color: AppConstColors.blue600,
                                              textAlign: TextAlign.center,
                                              fontWeight: FontWeight.w600,
                                              maxLines: 2,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                mobile: Dialog(
                  insetPadding: const EdgeInsets.symmetric(horizontal: 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IntrinsicHeight(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: AppConstColors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      // height: 320,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            //icons
                            Padding(
                              padding: const EdgeInsets.all(5),
                              child: SvgPicture.asset(
                                state.icon ?? AppConstIcons.user_group_svg,
                                height: 65,
                                color: AppConstColors.dark,
                              )
                                  .animate(
                                    onPlay: (controller) => controller.loop(reverse: true),
                                  )
                                  .rotate(
                                    begin: -0.01,
                                    end: 0.01,
                                    duration: 0.7.seconds,
                                  ),
                            ),
                            AppBox.h8,
                            //body
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: AppConstTextMobile.body2(
                                        text: state.titulo,
                                        textAlign: TextAlign.center,
                                        fontWeight: FontWeight.bold,
                                        maxLines: 3,
                                      ),
                                    ),
                                  ],
                                ),
                                AppBox.h12,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: AppConstTextMobile.body2(
                                        text: state.texto,
                                        textAlign: TextAlign.center,
                                        maxLines: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            AppBox.h12,
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: Column(
                                children: [
                                  if (state.widget != null) state.widget!,
                                  if (state.onAceptar != null)
                                    Row(
                                      children: [
                                        Expanded(
                                          child: AppButtonDark(
                                            text: state.aceptarText ?? 'Accept',
                                            onTap: () {
                                              dialogCubit.disguiseDialog();
                                              state.onAceptar?.call();
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  if (state.onCancelar != null) ...[
                                    AppBox.h8,
                                    Row(
                                      children: [
                                        Expanded(
                                          child: AppButtonWhite(
                                            text: 'Cancel',
                                            onTap: () {
                                              dialogCubit.disguiseDialog();
                                              state.onCancelar?.call();
                                            },
                                            enable: true,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                  if (state.onExtraAction != null)
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 2.5),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: GestureDetector(
                                              onTap: () {
                                                dialogCubit.disguiseDialog();
                                                state.onExtraAction?.call();
                                                state.onCancelar?.call();
                                              },
                                              child: AppConstTextMobile.body2(
                                                text: state.textExtraAction ?? 'texto por defecto defecto',
                                                color: AppConstColors.blue600,
                                                textAlign: TextAlign.center,
                                                fontWeight: FontWeight.w600,
                                                maxLines: 2,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            // AnimatedSwitcher(
                            //   duration: const Duration(seconds: 3),
                            //   child: state.onlyOptions
                            //       ? Row(
                            //           children: [
                            //             Expanded(
                            //               child: AppButtonShadowBlueR10(
                            //                 onPressed: () {
                            //                   dialogCubit.disguiseDialog();
                            //                   state.onAceptar?.call();
                            //                 },
                            //                 text: 'Continuar',
                            //               ),
                            //             ),
                            //           ],
                            //         )
                            //       : Row(
                            //           // textDirection: TextDirection.rtl,
                            //           children: [
                            //             Expanded(
                            //               child: AppButtonShadowWhiteR10(
                            //                 onPressed: () {
                            //                   dialogCubit.disguiseDialog();
                            //                   state.onCancelar?.call();
                            //                 },
                            //                 text: 'Cancelar',
                            //               ),
                            //             ),
                            //             AppBox.w10,
                            //             Expanded(
                            //               child: AppButtonShadowBlueR10(
                            //                 onPressed: () {
                            //                   dialogCubit.disguiseDialog();
                            //                   state.onAceptar?.call();
                            //                 },
                            //                 text: 'Aceptar',
                            //               ),
                            //             ),
                            //           ],
                            //         ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
