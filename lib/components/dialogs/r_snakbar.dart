import 'package:get/get.dart';

import '../../theme/style/app_colors.dart';

rSnackbar({bool isError = true, required String title, required msg}) {
  Get.snackbar(title, msg, backgroundColor: isError ? AppColors.coralRed.withOpacity(1) : AppColors.green, colorText: AppColors.colorFF);
}
