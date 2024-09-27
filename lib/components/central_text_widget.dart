import 'package:flutter/material.dart';

import '../theme/style/app_colors.dart';
import '../theme/style/app_text_styles.dart';

class CentralTextWidget extends StatelessWidget {
  final String text;
  final Color textColor;
  const CentralTextWidget({super.key, required this.text, this.textColor = AppColors.colorFF});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: AppTextStyles.p2.copyWith(fontSize: 16, fontWeight: FontWeight.normal, color: textColor),
      ),
    );
  }
}
