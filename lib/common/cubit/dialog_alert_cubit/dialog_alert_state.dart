part of 'dialog_alert_cubit.dart';

@freezed
class DialogAlertState with _$DialogAlertState {
  const factory DialogAlertState({
    @Default(false) bool show,
    @Default(false) bool onlyOptions,
    @Default('titulo') String titulo,
    @Default('texto') String texto,
    String? textExtraAction,
    @Default(AppConstImages.background_card_event) String? icon,
    @Default(AppConstColors.grey100) Color colorBackground,
    @Default(null) void Function()? onAceptar,
    @Default(null) void Function()? onCancelar,
    @Default(null) void Function()? onExtraAction,
    @Default(false) bool? isRotate,
    String? aceptarText,
    Widget? widget,
  }) = _DialogState;
}
