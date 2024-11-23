// ignore_for_file: avoid_positional_boolean_parameters

import 'package:bloc/bloc.dart';

class DarkModeCubit extends Cubit<bool> {
  DarkModeCubit() : super(false);

  void changeDarkMode(bool mode) {
    emit(mode);
  }
}
