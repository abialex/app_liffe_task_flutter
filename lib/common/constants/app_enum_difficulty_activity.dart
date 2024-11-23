// ignore_for_file: no_default_cases

import 'dart:ui';

import 'package:app_liffe_task_flutter/common/constants/app_const_colors.dart';

enum DifficultyActivityEnum {
  lightIntensity,
  mediumIntensity,
  highIntensity,
  workSpace,
  childCare,
}

extension DifficultyActivityExtension on DifficultyActivityEnum {
  String get name {
    switch (this) {
      case DifficultyActivityEnum.lightIntensity:
        return 'light';
      case DifficultyActivityEnum.mediumIntensity:
        return 'medium';
      case DifficultyActivityEnum.highIntensity:
        return 'high';
      case DifficultyActivityEnum.workSpace:
        return 'workspace';
      case DifficultyActivityEnum.childCare:
        return 'childcare';
      default:
        return 'default';
    }
  }

  Color get colorBackground {
    switch (this) {
      case DifficultyActivityEnum.lightIntensity:
        return AppConstColors.lightIntensity;
      case DifficultyActivityEnum.mediumIntensity:
        return AppConstColors.mediumIntensity;
      case DifficultyActivityEnum.highIntensity:
        return AppConstColors.highIntensity;
      case DifficultyActivityEnum.workSpace:
        return AppConstColors.workSpace;
      case DifficultyActivityEnum.childCare:
        return AppConstColors.childCare;
      default:
        return AppConstColors.white;
    }
  }

  Color get colorText {
    switch (this) {
      case DifficultyActivityEnum.lightIntensity:
        return AppConstColors.lightIntensityTitle;
      case DifficultyActivityEnum.mediumIntensity:
        return AppConstColors.mediumIntensityTitle;
      case DifficultyActivityEnum.highIntensity:
        return AppConstColors.highIntensityTitle;
      case DifficultyActivityEnum.workSpace:
        return AppConstColors.workSpace;
      case DifficultyActivityEnum.childCare:
        return AppConstColors.childCareTitle;
      default:
        return AppConstColors.white;
    }
  }

  static DifficultyActivityEnum getEstadoById(int number) {
    switch (number) {
      case 1:
        return DifficultyActivityEnum.lightIntensity;
      case 2:
        return DifficultyActivityEnum.mediumIntensity;
      case 3:
        return DifficultyActivityEnum.highIntensity;
      case 4:
        return DifficultyActivityEnum.workSpace;
      case 5:
        return DifficultyActivityEnum.childCare;
      default:
        throw ArgumentError('Invalid id: $number');
    }
  }

  static int getIdByEstado(DifficultyActivityEnum estado) {
    switch (estado) {
      case DifficultyActivityEnum.lightIntensity:
        return 1;
      case DifficultyActivityEnum.mediumIntensity:
        return 2;
      case DifficultyActivityEnum.highIntensity:
        return 3;
      case DifficultyActivityEnum.workSpace:
        return 4;
      case DifficultyActivityEnum.childCare:
        return 5;
      default:
        throw ArgumentError('Invalid EstadoComanda: $estado');
    }
  }

  static DifficultyActivityEnum fromJson(String json) {
    switch (json) {
      case 'lightIntensity':
        return DifficultyActivityEnum.lightIntensity;
      case 'mediumIntensity':
        return DifficultyActivityEnum.mediumIntensity;
      case 'highIntensity':
        return DifficultyActivityEnum.highIntensity;
      case 'workSpace':
        return DifficultyActivityEnum.workSpace;
      case 'childCare':
        return DifficultyActivityEnum.childCare;
      default:
        throw ArgumentError('Unknown enum value: $json');
    }
  }
}
