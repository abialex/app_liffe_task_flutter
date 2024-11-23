import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_data_model.freezed.dart';
part 'category_data_model.g.dart';

@freezed
class CategoryDataModel with _$CategoryDataModel {
  const factory CategoryDataModel({
    required int id,
    required String name,
    required bool isSelected,
  }) = _CategoryDataModel;

  factory CategoryDataModel.fromJson(Map<String, dynamic> json) => _$CategoryDataModelFromJson(json);
}
