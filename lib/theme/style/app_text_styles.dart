import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

/// Custom text styles for the app
class AppTextStyles {
  static const double height = 1.4;

  static TextStyle base = GoogleFonts.inter(
    textStyle: const TextStyle(
        // height: height,
        ),
  );

  static TextStyle h0 = base.copyWith(
    fontSize: 34,
    fontWeight: FontWeight.w600,
    color: AppColors.text,
  );

  static TextStyle h1 = base.copyWith(
    fontSize: 30,
    fontWeight: FontWeight.w600,
    color: AppColors.text,
  );

  static TextStyle h2 = base.copyWith(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: AppColors.text,
  );
  static TextStyle h20 = base.copyWith(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.text,
  );

  static TextStyle h3 = base.copyWith(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.text,
  );

  static TextStyle h18 = base.copyWith(
    fontSize: 18,
    color: AppColors.text,
  );

  static TextStyle p1 = base.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.colorFF,
  );

  static TextStyle p2 = base.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static TextStyle p3 = base.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.text,
  );

  static TextStyle p4 = base.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static TextStyle p5 = base.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static TextStyle p6 = base.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );
  static TextStyle p7 = base.copyWith(
    fontSize: 10,
    fontWeight: FontWeight.w400,
  );

  static TextStyle purple14 = base.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Colors.purple,
  );

  static TextStyle bold = base.copyWith(
    fontWeight: FontWeight.bold,
  );

  static TextStyle bold16 = base.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  static TextStyle bold12 = base.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
}
