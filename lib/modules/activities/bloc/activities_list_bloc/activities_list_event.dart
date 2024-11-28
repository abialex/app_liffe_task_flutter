part of 'activities_list_bloc.dart';

@freezed
class ActivitiesListEvent with _$ActivitiesListEvent {
  const factory ActivitiesListEvent.initial() = InitalEvent;
  const factory ActivitiesListEvent.getActivitiesByCategoryId(int? categoryId) = GetActivitiesByCategoryIdEvent;
  const factory ActivitiesListEvent.getActivities() = GetActivitiesEvent;
  const factory ActivitiesListEvent.joinActivity(List<ActivityDataModel> list, ActivityDataModel activity) = JoinActivitieEvent;
}
