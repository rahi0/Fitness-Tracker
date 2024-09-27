import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/dialogs/r_snakbar.dart';
import '../models/workout_model.dart';
import '../utils/sharedpref_keys.dart';
import '../utils/translation/language_keys.dart';

class WorkoutController extends GetxController {
  var workouts = <Workout>[].obs;
  RxList<WorkoutModel> savedWorkoutSessions = <WorkoutModel>[].obs;
  bool get isWorkoutListEmpty => workouts.isEmpty;
  int? loadedSessionIndex;
  var weightController = TextEditingController().obs;
  var repsController = TextEditingController().obs;
  var selectedExercise = Rxn<String>();

  // Function to initialize the dialog with values (for editing existing workout)
  void initializeWorkoutDialog({String? exercise, String? weight, String? reps}) {
    selectedExercise.value = exercise;
    weightController.value.text = weight ?? '';
    repsController.value.text = reps ?? '';
  }

  // Function to clear the values when needed
  void clearWorkoutDialog() {
    selectedExercise.value = null;
    weightController.value.clear();
    repsController.value.clear();
  }

  void addOrUpdateWorkout(String exercise, String weight, String reps, {Workout? workout}) {
    if (workout == null) {
      // Add a new workout
      addWorkout(exercise: exercise, weight: weight, reps: reps);
    } else {
      // Edit the existing workout
      updateWorkout(workout: workout, exercise: exercise, weight: weight, reps: reps);
    }
  }

  void addWorkout({required String exercise, required String weight, required String reps}) {
    Workout workout = Workout(
      exercise: exercise,
      weight: weight,
      reps: reps,
      datetime: DateTime.now(),
    );
    workouts.add(workout);
  }

  void updateWorkout({required Workout workout, required String exercise, required String weight, required String reps}) {
    Workout updatedWorkout = Workout(
      exercise: exercise,
      weight: weight,
      reps: reps,
      datetime: workout.datetime,
    );

    // Find the index of the workout to update
    int index = workouts.indexOf(workout);
    if (index != -1) {
      workouts[index] = updatedWorkout;
    }

    // finishWorkoutSession();
  }

  Future<void> finishWorkoutSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Create a WorkoutModel from the current list of workouts
    WorkoutModel workoutSession = WorkoutModel(
      workouts: List<Workout>.from(workouts),
      datetime: DateTime.now(),
    );

    // Check if updating an existing session
    if (loadedSessionIndex != null) {
      savedWorkoutSessions[loadedSessionIndex!] = workoutSession;
      rSnackbar(title: AppConstants.success.tr, msg: AppConstants.workoutSessionUpdated.tr, isError: false);
    } else {
      savedWorkoutSessions.add(workoutSession);
      rSnackbar(title: AppConstants.success.tr, msg: AppConstants.workoutSessionSaved.tr, isError: false);
    }

    List<String> updatedSessions = savedWorkoutSessions.map((session) => workoutModelToJson(session)).toList();

    await prefs.setStringList(AppSharedprefKey.workoutHistory, updatedSessions);

    workouts.clear();
    loadedSessionIndex = null; // Reset loaded session index
  }

  // Method to load all workout sessions from SharedPreferences
  Future<void> loadWorkoutSessions() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> savedSessions = prefs.getStringList(AppSharedprefKey.workoutHistory) ?? [];

    // Clear the current list of saved sessions
    savedWorkoutSessions.clear();

    savedSessions.forEach((sessionJson) {
      WorkoutModel session = workoutModelFromJson(sessionJson);
      savedWorkoutSessions.add(session);
    });
  }

  // Method to delete a workout session
  void deleteWorkoutSession(int index) async {
    savedWorkoutSessions.removeAt(index);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> savedSessions = savedWorkoutSessions.map((session) => workoutModelToJson(session)).toList();
    prefs.setStringList(AppSharedprefKey.workoutHistory, savedSessions);

    rSnackbar(title: AppConstants.deleted.tr, msg: AppConstants.workoutSessionDeleted.tr);
  }

  void loadSelectedWorkoutSession({required WorkoutModel session, required int index}) {
    workouts.clear();
    workouts.addAll(session.workouts); // Load the selected session
    loadedSessionIndex = index; // Store the index of the loaded session
  }
}
