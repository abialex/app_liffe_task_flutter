import 'package:app_liffe_task_flutter/common/constants/app_enum_difficulty_activity.dart';
import 'package:app_liffe_task_flutter/modules/activities/model/activity_data_model.dart';
import 'package:app_liffe_task_flutter/modules/activities/model/category_data_model.dart';

final categoryDataList = <CategoryDataModel>[
  const CategoryDataModel(id: 0, name: "All", isSelected: false),
  const CategoryDataModel(id: 1, name: "Sports", isSelected: false),
  const CategoryDataModel(id: 2, name: "Food", isSelected: false),
  const CategoryDataModel(id: 3, name: "Kids", isSelected: false),
  const CategoryDataModel(id: 4, name: "Creative", isSelected: false),
  const CategoryDataModel(id: 5, name: "Popular", isSelected: false),
  const CategoryDataModel(id: 6, name: "Calm", isSelected: false),
];
final List<ActivityDataModel> activities = [
  const ActivityDataModel(
    id: 1,
    time: "09:00", // Formato 24 horas
    duration: "60", // Duración en minutos
    title: "Morning Yoga",
    location: "Central Park",
    spotsAvailable: 15,
    price: 10.0,
    dificultys: [DifficultyActivityEnum.lightIntensity, DifficultyActivityEnum.mediumIntensity],
    categoryId: 1, // Categoría 1
  ),
  const ActivityDataModel(
    id: 2,
    time: "14:00", // Formato 24 horas
    duration: "120", // Duración en minutos
    title: "Rock Climbing",
    location: "Downtown Gym",
    spotsAvailable: 8,
    price: 25.0,
    dificultys: [DifficultyActivityEnum.highIntensity],
    categoryId: 2, // Categoría 2
  ),
  const ActivityDataModel(
    id: 3,
    time: "17:30", // Formato 24 horas
    duration: "90", // Duración en minutos
    title: "Cooking Workshop",
    location: "Community Center",
    spotsAvailable: 10,
    price: 15.0,
    dificultys: [DifficultyActivityEnum.lightIntensity, DifficultyActivityEnum.childCare],
    categoryId: 3, // Categoría 3
  ),
  const ActivityDataModel(
    id: 4,
    time: "19:00", // Formato 24 horas
    duration: "120", // Duración en minutos
    title: "Evening Meditation",
    location: "Yoga Studio",
    spotsAvailable: 20,
    price: 12.0,
    dificultys: [DifficultyActivityEnum.lightIntensity],
    categoryId: 4, // Categoría 4
  ),
  const ActivityDataModel(
    id: 5,
    time: "10:00", // Formato 24 horas
    duration: "180", // Duración en minutos
    title: "Hackathon Workshop",
    location: "Tech Hub",
    spotsAvailable: 30,
    price: 0.0, // Gratis
    dificultys: [DifficultyActivityEnum.mediumIntensity, DifficultyActivityEnum.workSpace],
    categoryId: 5, // Categoría 5
  ),
];
