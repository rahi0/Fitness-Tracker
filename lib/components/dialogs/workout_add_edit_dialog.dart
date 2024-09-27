import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/workout_controller.dart';
import '../../models/workout_model.dart';
import '../../utils/translation/language_keys.dart';
import '../../components/dialogs/r_snakbar.dart';
import '../r_dropdown.dart';

void showAddOrEditWorkoutDialog(BuildContext context, {Workout? workout}) {
  final WorkoutController workoutController = Get.find<WorkoutController>();

  if (workout != null) {
    workoutController.initializeWorkoutDialog(
      exercise: workout.exercise,
      weight: workout.weight,
      reps: workout.reps,
    );
  } else {
    workoutController.clearWorkoutDialog();
  }

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(workout == null ? AppConstants.addWorkout.tr : AppConstants.editWorkout.tr),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Obx(() {
              return RDropdownWidget(
                hint: AppConstants.selectExercise.tr,
                list: AppConstants.workoutType,
                selectedValue: workoutController.selectedExercise.value,
                onChanged: (String? newValue) {
                  workoutController.selectedExercise.value = newValue;
                },
              );
            }),
            Obx(() => TextField(
                  controller: workoutController.weightController.value,
                  decoration: InputDecoration(labelText: '${AppConstants.weight.tr} (kg)'),
                  keyboardType: TextInputType.number,
                )),
            Obx(() => TextField(
                  controller: workoutController.repsController.value,
                  decoration: InputDecoration(labelText: AppConstants.reps.tr),
                  keyboardType: TextInputType.number,
                )),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.back(); // Close dialog
            },
            child: Text(AppConstants.cancel.tr),
          ),
          TextButton(
            onPressed: () {
              if (workoutController.selectedExercise.value != null && workoutController.weightController.value.text.isNotEmpty && workoutController.repsController.value.text.isNotEmpty) {
                // Save or update workout
                workoutController.addOrUpdateWorkout(
                  workoutController.selectedExercise.value!,
                  workoutController.weightController.value.text,
                  workoutController.repsController.value.text,
                  workout: workout,
                );
                Get.back(); // Close dialog
              } else {
                rSnackbar(title: AppConstants.error.tr, msg: AppConstants.pleaseFillAllFields.tr);
              }
            },
            child: Text(AppConstants.save.tr),
          ),
        ],
      );
    },
  );
}
