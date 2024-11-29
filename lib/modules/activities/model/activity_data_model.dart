import 'package:app_liffe_task_flutter/common/constants/app_enum_difficulty_activity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'activity_data_model.freezed.dart';
part 'activity_data_model.g.dart';

@freezed
class ActivityDataModel with _$ActivityDataModel {
  const factory ActivityDataModel({
    required int id,
    required int categoryId,
    required String time,
    required String duration,
    required String title,
    required String location,
    required int spotsAvailable,
    required double price,
    required bool isJoin,
    required List<DifficultyActivityEnum> dificultys,
  }) = _ActivityDataModel;

  factory ActivityDataModel.fromJson(Map<String, dynamic> json) => _$ActivityDataModelFromJson(json);
}
