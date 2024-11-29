part of 'activities_list_bloc.dart';

@freezed
class ActivitiesListState with _$ActivitiesListState {
  const factory ActivitiesListState.initial() = _Initial;
  const factory ActivitiesListState.loading() = ActivitiesLoading;
  const factory ActivitiesListState.error(String failure) = _Error;
  const factory ActivitiesListState.activitiesLoaded(List<ActivityDataModel> list) = ActivitiesLoaded;
  const factory ActivitiesListState.activitiesLoadedByCategoryIdFilter(List<ActivityDataModel> list) = ActivitiesByCategoryIdLoaded;
}
