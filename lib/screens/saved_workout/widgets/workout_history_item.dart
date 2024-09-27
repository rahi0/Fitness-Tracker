import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/buttons/r_dismissable_button.dart';
import '../../../controllers/home_controller.dart';
import '../../../controllers/workout_controller.dart';
import '../../../models/workout_model.dart';
import '../../../theme/style/app_colors.dart';
import '../../../theme/style/app_shadows.dart';
import '../../../utils/date_time_formater.dart';
import '../../../utils/translation/language_keys.dart';

class WorkoutHistoryItem extends StatelessWidget {
  const WorkoutHistoryItem({super.key, required this.controller, required this.session, required this.index});

  final WorkoutController controller;
  final WorkoutModel session;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
      child: RDismissableButton(
        onTap: () {
          controller.loadSelectedWorkoutSession(session: session, index: index);
          Get.find<HomeController>().changeTabIndex(0);
        },
        itemKey: Key(session.datetime.toString()),
        onDismissed: (direction) {
          controller.deleteWorkoutSession(index);
        },
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.grey900,
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: AppShadows.primaryShadow,
          ),
          child: ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  CustomDateTimeFormatter.dayNameTimeFormatter.format(session.datetime),
                  style: const TextStyle(color: AppColors.colorFF),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  CustomDateTimeFormatter.dateFormatterDMYslash.format(session.datetime),
                  style: const TextStyle(color: AppColors.colorFF, fontSize: 12),
                ),
                Divider()
              ],
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: session.workouts.map((workout) {
                return Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    "${workout.exercise} - ${AppConstants.weight}: ${workout.weight} kg, ${AppConstants.reps}: ${workout.reps}",
                    style: const TextStyle(color: AppColors.colorFF),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
