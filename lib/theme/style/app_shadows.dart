import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppShadows {
  static List<BoxShadow> primaryShadow = [
    const BoxShadow(
      color: AppColors.colorBlack87,
      spreadRadius: 2,
      blurRadius: 5,
      offset: Offset(0, 3),
    ),
  ];

  static List<BoxShadow> buttonShahdow = [
    BoxShadow(color: Colors.grey[200]!, offset: const Offset(5.0, 6.0), blurRadius: 10.0, spreadRadius: 1.0),
    BoxShadow(color: Colors.grey[200]!, offset: const Offset(-3.0, 0.0), blurRadius: 4.0, spreadRadius: 0.1),
  ];

  static BoxDecoration primaryCardDecoration = BoxDecoration(
    color: AppColors.grey900,
    boxShadow: primaryShadow,
    borderRadius: BorderRadius.circular(5),
  );
}
