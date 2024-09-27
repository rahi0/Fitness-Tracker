import 'package:flutter/material.dart';

import '../../theme/style/app_colors.dart';

class RDismissableButton extends StatelessWidget {
  final VoidCallback onTap;
  final Key itemKey;
  final DismissDirectionCallback onDismissed;
  final Widget child;

  const RDismissableButton({super.key, required this.onTap, required this.itemKey, required this.onDismissed, required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Dismissible(
          key: itemKey,
          background: Container(
            color: AppColors.coralRed,
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 20.0),
            child: const Icon(Icons.delete, color: AppColors.colorFF),
          ),
          direction: DismissDirection.endToStart,
          onDismissed: onDismissed,
          child: child,
        ));
  }
}
