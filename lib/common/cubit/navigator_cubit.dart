// ignore_for_file: lines_longer_than_80_chars, avoid_redundant_argument_values, avoid_positional_boolean_parameters, sort_constructors_first

import 'package:bloc/bloc.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationState(selectedIndex: 0, showBottomNavigationBar: true));

  void changePage(int index) {
    emit(NavigationState(selectedIndex: index, showBottomNavigationBar: true));
  }

  void toggleBottomNavigationBar(bool show) {
    emit(NavigationState(selectedIndex: state.selectedIndex, showBottomNavigationBar: show));
  }
}

class NavigationState {
  final int selectedIndex;
  final bool showBottomNavigationBar;

  NavigationState({required this.selectedIndex, this.showBottomNavigationBar = true});
}
