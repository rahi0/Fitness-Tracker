import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/style/app_colors.dart';
import '../utils/translation/language_keys.dart';

class SetCircleWidget extends StatelessWidget {
  final String value;
  const SetCircleWidget({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      padding: const EdgeInsets.only(top: 8, bottom: 0),
      decoration: BoxDecoration(color: AppColors.green, shape: BoxShape.circle),
      child: Column(
        children: [
          Text(
            AppConstants.set.tr,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.colorFF,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppColors.colorFF,
            ),
          ),
        ],
      ),
    );
  }
}
