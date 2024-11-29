import 'package:app_liffe_task_flutter/common/constants/app_const_index.dart';
import 'package:app_liffe_task_flutter/database/data.dart';
import 'package:app_liffe_task_flutter/modules/activities/model/activity_data_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'activities_list_event.dart';
part 'activities_list_state.dart';
part 'activities_list_bloc.freezed.dart';

class ActivitiesListBloc extends Bloc<ActivitiesListEvent, ActivitiesListState> {
  ActivitiesListBloc() : super(const _Initial()) {
    on<GetActivitiesEvent>(_getActivities);
    on<GetActivitiesByCategoryIdEvent>(_getActivitiesByCategoryId);
    on<JoinActivitieEvent>(_joinActivity);
  }

  Future<void> _getActivities(GetActivitiesEvent event, Emitter<ActivitiesListState> emit) async {
    emit(const ActivitiesListState.loading());
    Future.delayed(1.seconds);
    emit(ActivitiesListState.activitiesLoaded(activities));
  }

  Future<void> _getActivitiesByCategoryId(GetActivitiesByCategoryIdEvent event, Emitter<ActivitiesListState> emit) async {
    emit(const ActivitiesListState.loading());
    Future.delayed(1.seconds);
    late List<ActivityDataModel> activitiesByCategoryId;
    if (event.categoryId == AppConstIndex.categoryIdAll || event.categoryId == null) {
      activitiesByCategoryId = activities;
    } else {
      activitiesByCategoryId = activities.where((element) => element.categoryId == event.categoryId).toList();
    }
    emit(ActivitiesListState.activitiesLoadedByCategoryIdFilter(activitiesByCategoryId));
  }

  Future<void> _joinActivity(JoinActivitieEvent event, Emitter<ActivitiesListState> emit) async {
    bool isWasByCategory = false;
    final activitiesUpdate = [...event.list];
    if (state is ActivitiesByCategoryIdLoaded) {
      isWasByCategory = true;
    }
    emit(const ActivitiesListState.loading());
    Future.delayed(1.seconds);
    final indexActivity = activitiesUpdate.indexWhere(
      (element) => element.id == event.activity.id,
    );

    if (indexActivity == -1) {
      emit(const ActivitiesListState.error('Activity dont found'));
      return;
    }
    activitiesUpdate[indexActivity] = activitiesUpdate[indexActivity].copyWith(isJoin: true);

    if (isWasByCategory) {
      emit(ActivitiesListState.activitiesLoadedByCategoryIdFilter([...activitiesUpdate]));
    } else {
      emit(ActivitiesListState.activitiesLoaded([...activitiesUpdate]));
    }
  }
}
