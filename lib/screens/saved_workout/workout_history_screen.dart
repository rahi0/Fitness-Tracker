import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/central_text_widget.dart';
import '../../controllers/workout_controller.dart';
import '../../models/workout_model.dart';
import '../../utils/translation/language_keys.dart';
import 'widgets/workout_history_item.dart';

class WorkoutHistoryScreen extends StatelessWidget {
  final WorkoutController controller = Get.find<WorkoutController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (controller.savedWorkoutSessions.isEmpty) {
          return CentralTextWidget(
            text: AppConstants.noSavedWorkoutSessions.tr,
          );
        }

        return ListView.builder(
          itemCount: controller.savedWorkoutSessions.length,
          itemBuilder: (context, index) {
            WorkoutModel session = controller.savedWorkoutSessions[index];

            // Add Dismissible widget to allow swipe-to-delete
            return WorkoutHistoryItem(
              controller: controller,
              session: session,
              index: index,
            );
          },
        );
      }),
    );
  }
}
