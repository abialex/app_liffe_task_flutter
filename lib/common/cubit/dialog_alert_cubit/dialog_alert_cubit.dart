// ignore_for_file: depend_on_referenced_packages

import 'package:app_liffe_task_flutter/common/constants/app_const_colors.dart';
import 'package:app_liffe_task_flutter/common/constants/app_const_images.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dialog_alert_cubit.freezed.dart';
part 'dialog_alert_state.dart';

class DialogAlertCubit extends Cubit<DialogAlertState> {
  DialogAlertCubit() : super(const DialogAlertState());

  void showCustomAlert({
    required String titulo,
    required String texto,
    required void Function() onAceptar,
    String? textExtraAction,
    void Function()? onCancelar,
    void Function()? onExtraAction,
    Color colorBackground = Colors.black54,
    bool onlyOptions = false,
    String icon = AppConstImages.background_card_event,
    bool? isRotate,
    Widget? widget,
    String? aceptarText,
  }) {
    emit(
      state.copyWith(
        show: true,
        titulo: titulo,
        texto: texto,
        textExtraAction: textExtraAction,
        onAceptar: onAceptar,
        onCancelar: onCancelar,
        onExtraAction: onExtraAction,
        colorBackground: colorBackground,
        icon: icon,
        onlyOptions: onlyOptions,
        isRotate: isRotate,
        widget: widget,
        aceptarText: aceptarText,
      ),
    );
  }

  void showErrorAlert({
    required String titulo,
    required String texto,
    void Function()? onAceptar,
    void Function()? onCancelar,
    bool? isRotate,
  }) {
    emit(
      state.copyWith(
        show: true,
        onlyOptions: true,
        titulo: titulo,
        icon: AppConstImages.background_card_event,
        texto: texto,
        onAceptar: () {
          onAceptar?.call();
        },
        onCancelar: onCancelar,
        isRotate: isRotate,
      ),
    );
  }

  void disguiseDialog() {
    emit(
      state.copyWith(show: false, colorBackground: Colors.greenAccent),
    );
  }
}
