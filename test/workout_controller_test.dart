import 'package:fitness_tracker/controllers/workout_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late WorkoutController workoutController;

  setUp(() {
    workoutController = WorkoutController();
  });

  test('Add workout correctly updates the list', () {
    workoutController.addWorkout(
      exercise: 'Bench Press',
      weight: '80',
      reps: '10',
    );

    expect(workoutController.workouts.length, 1);
    expect(workoutController.workouts[0].exercise, 'Bench Press');
  });
}
