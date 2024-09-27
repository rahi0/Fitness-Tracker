import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/workout_controller.dart';
import '../../../theme/style/app_colors.dart';
import '../../../theme/style/app_shadows.dart';
import '../../../utils/translation/language_keys.dart';

class FinishWorkoutButton extends StatelessWidget {
  const FinishWorkoutButton({
    super.key,
    required this.controller,
  });

  final WorkoutController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: AppColors.grey850,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: AppShadows.primaryShadow,
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        leading: const CircleAvatar(
          backgroundColor: AppColors.coralRed,
          child: Icon(Icons.stop, color: AppColors.colorFF),
        ),
        title: Text(
          AppConstants.finishWorkout.tr,
          style: const TextStyle(color: AppColors.colorFF, fontSize: 18),
        ),
        onTap: () {
          controller.finishWorkoutSession();
        },
      ),
    );
  }
}
