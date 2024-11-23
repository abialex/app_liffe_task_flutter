import 'package:app_liffe_task_flutter/modules/activities/model/category_data_model.dart';
import 'package:bloc/bloc.dart';

class CategorySelectedCubit extends Cubit<CategoryDataModel?> {
  CategorySelectedCubit() : super(null);

  void setSelected(CategoryDataModel categoryDataModel) {
    emit(categoryDataModel);
  }

  CategoryDataModel? getSelected() {
    return state;
  }

  void reset() {
    emit(null);
  }
}
