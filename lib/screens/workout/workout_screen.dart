import 'package:flutter/material.dart';

import '../../components/central_text_widget.dart';
import '../../controllers/workout_controller.dart';
import '../../utils/size_config.dart';
import '../../utils/translation/language_keys.dart';
import 'package:get/get.dart';

import 'widgets/finish_workout_button.dart';
import 'widgets/workout_item_widget.dart';

// ignore: must_be_immutable
class WorkoutScreen extends StatelessWidget {
  const WorkoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SizedBox(width: SizeConfig.screenWidth, height: SizeConfig.screenHeight, child: WorkoutList()),
    );
  }
}

class WorkoutList extends StatelessWidget {
  final WorkoutController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Padding(
          padding: const EdgeInsets.all(10.0),
          child: controller.isWorkoutListEmpty
              ? CentralTextWidget(
                  text: AppConstants.addButtonText.tr,
                )
              : Column(
                  children: [
                    FinishWorkoutButton(controller: controller),
                    Expanded(
                        child: ListView.builder(
                      itemCount: controller.workouts.length,
                      padding: const EdgeInsets.only(bottom: 80),
                      itemBuilder: (context, index) {
                        return WorkoutItemWidget(controller: controller, index: index);
                      },
                    )),
                  ],
                ),
        ));
  }
}
