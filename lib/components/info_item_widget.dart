import 'package:fitness_tracker/theme/style/app_colors.dart';
import 'package:flutter/material.dart';

class InfoItem extends StatelessWidget {
  final String title;
  final String value;
  const InfoItem({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$title:',
          style: TextStyle(color: AppColors.grey400, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          value,
          style: TextStyle(color: AppColors.grey400),
        ),
      ],
    );
  }
}
