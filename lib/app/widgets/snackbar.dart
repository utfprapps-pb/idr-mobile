import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idr_mobile/core/theme/ui_colors.dart';

successSnackBar(String title, String message) => Get.snackbar(
      title,
      message,
      colorText: Colors.white,
      backgroundColor: UIColors.successColor,
      icon: const Icon(Icons.check),
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(10),
    );

errorSnackBar(String title, String message) => Get.snackbar(
      title,
      message,
      colorText: Colors.white,
      backgroundColor: UIColors.dangerColor,
      icon: const Icon(Icons.dangerous),
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(10),
    );
