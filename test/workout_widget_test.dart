import 'package:fitness_tracker/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  testWidgets('Check if Add Workout button shows dialog', (WidgetTester tester) async {
    await tester.pumpWidget(
      GetMaterialApp(
        home: HomeScreen(),
      ),
    );
    expect(find.byIcon(Icons.add), findsOneWidget);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();

    expect(find.text('Select Exercise'), findsOneWidget);
  });
}
