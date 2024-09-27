import 'package:fitness_tracker/controllers/home_controller.dart';
import 'package:fitness_tracker/controllers/workout_controller.dart';
import 'package:fitness_tracker/screens/saved_workout/workout_history_screen.dart';
import 'package:fitness_tracker/theme/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/dialogs/workout_add_edit_dialog.dart';
import '../utils/translation/language_keys.dart';
import 'workout/workout_screen.dart';

class HomeScreen extends StatelessWidget {
  final HomeController controller = Get.put(HomeController()); // GetX Controller
  final WorkoutController workOutcontroller = Get.put(WorkoutController());

  final List<Widget> screens = [
    WorkoutScreen(),
    WorkoutHistoryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    workOutcontroller.loadWorkoutSessions();
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(controller.selectedIndex.value == 0 ? AppConstants.workout.tr : AppConstants.history.tr)),
      ),
      body: Obx(() => screens[controller.selectedIndex.value]), // Display selected screen

      floatingActionButton: Obx(
        () => controller.selectedIndex.value == 0
            ? FloatingActionButton(
                onPressed: () {
                  showAddOrEditWorkoutDialog(context); // Show the dialog
                },
                child: const Icon(Icons.add),
              )
            : const SizedBox(),
      ),

      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          backgroundColor: AppColors.grey900,
          selectedItemColor: AppColors.colorPrimary,
          unselectedItemColor: AppColors.colorFF,
          currentIndex: controller.selectedIndex.value,
          onTap: controller.changeTabIndex, // Call method to change index
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.list),
              label: AppConstants.workout.tr,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.history),
              label: AppConstants.history.tr,
            ),
          ],
        ),
      ),
    );
  }
}
