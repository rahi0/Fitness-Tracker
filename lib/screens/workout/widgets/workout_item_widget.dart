import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/buttons/r_dismissable_button.dart';
import '../../../components/dialogs/r_snakbar.dart';
import '../../../components/dialogs/workout_add_edit_dialog.dart';
import '../../../components/info_item_widget.dart';
import '../../../components/set_circle_widget.dart';
import '../../../controllers/workout_controller.dart';
import '../../../theme/style/app_colors.dart';
import '../../../theme/style/app_shadows.dart';
import '../../../utils/translation/language_keys.dart';

class WorkoutItemWidget extends StatelessWidget {
  const WorkoutItemWidget({
    super.key,
    required this.controller,
    required this.index,
  });

  final WorkoutController controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Obx(() => RDismissableButton(
          onTap: () {
            // Call the dialog for editing the workout item
            showAddOrEditWorkoutDialog(context, workout: controller.workouts[index]);
          },
          onDismissed: (direction) {
            controller.workouts.removeAt(index); // Remove the item from the list
            rSnackbar(title: AppConstants.deleted.tr, msg: AppConstants.workoutDeleted.tr);
          },
          itemKey: Key(controller.workouts[index].datetime.toString()),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: AppShadows.primaryShadow,
              ),
              child: ListTile(
                leading: SetCircleWidget(
                  value: '${index + 1}',
                ),
                title: Text(
                  controller.workouts[index].exercise,
                  style: const TextStyle(color: AppColors.colorFF),
                ),
                subtitle: Row(
                  children: [
                    InfoItem(
                      title: AppConstants.weight.tr,
                      value: '${controller.workouts[index].weight} kg',
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    InfoItem(
                      title: AppConstants.repetitions.tr,
                      value: controller.workouts[index].reps,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
