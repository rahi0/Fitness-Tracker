// To parse this JSON data, do
//
//     final workoutModel = workoutModelFromJson(jsonString);

import 'dart:convert';

WorkoutModel workoutModelFromJson(String str) => WorkoutModel.fromJson(json.decode(str));

String workoutModelToJson(WorkoutModel data) => json.encode(data.toJson());

class WorkoutModel {
  List<Workout> workouts;
  DateTime datetime;

  WorkoutModel({
    required this.workouts,
    required this.datetime,
  });

  factory WorkoutModel.fromJson(Map<String, dynamic> json) => WorkoutModel(
        workouts: List<Workout>.from(json["workouts"].map((x) => Workout.fromJson(x))),
        datetime: DateTime.parse(json["datetime"]),
      );

  Map<String, dynamic> toJson() => {
        "workouts": List<dynamic>.from(workouts.map((x) => x.toJson())),
        "datetime": datetime.toIso8601String(),
      };
}

class Workout {
  String exercise;
  String weight;
  String reps;
  DateTime datetime;

  Workout({
    required this.exercise,
    required this.weight,
    required this.reps,
    required this.datetime,
  });

  factory Workout.fromJson(Map<String, dynamic> json) => Workout(
        exercise: json["exercise"],
        weight: json["weight"],
        reps: json["reps"],
        datetime: DateTime.parse(json["datetime"]),
      );

  Map<String, dynamic> toJson() => {
        "exercise": exercise,
        "weight": weight,
        "reps": reps,
        "datetime": datetime.toIso8601String(),
      };
}
