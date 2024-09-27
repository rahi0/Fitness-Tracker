import 'package:flutter/material.dart';

import '../theme/style/app_colors.dart';
import '../theme/style/app_shadows.dart';
import '../theme/style/app_text_styles.dart';
import '../utils/size_config.dart';

class RDropdownWidget extends StatelessWidget {
  const RDropdownWidget({super.key, required this.onChanged, required this.selectedValue, required this.list, this.hint = "Select"});

  final void Function(String?)? onChanged;
  final String hint;
  final String? selectedValue;
  final List<String> list;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: Container(
        width: SizeConfig.screenWidth,
        decoration: AppShadows.primaryCardDecoration.copyWith(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.only(left: 20, right: 20),
        margin: const EdgeInsets.only(left: 0, right: 0, bottom: 10, top: 10),
        child: Row(
          children: [
            const Icon(Icons.filter_list_rounded, color: AppColors.colorPrimary),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: DropdownButton<String>(
                hint: Text(
                  hint,
                  style: AppTextStyles.p1.copyWith(fontWeight: FontWeight.bold),
                ),
                value: selectedValue,
                icon: const Icon(Icons.keyboard_arrow_down, color: AppColors.colorPrimary),
                iconSize: 30,
                elevation: 16,
                style: AppTextStyles.p1.copyWith(fontWeight: FontWeight.bold),
                onChanged: onChanged,
                items: list.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                dropdownColor: AppColors.grey900,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
