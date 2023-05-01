import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idr_mobile/app/data/enums/enum_snackbar_type.dart';
import 'package:idr_mobile/core/theme/ui_colors.dart';

final kPadding = 8.0; // up to you

class Snack {
  static show({
    required String content,
    SnackType snackType = SnackType.info,
    SnackBarBehavior behavior = SnackBarBehavior.fixed,
  }) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        content: Text(
          content,
          textAlign: TextAlign.center,
        ),
        elevation: 2,
        behavior: behavior,
        backgroundColor: _getSnackbarColor(snackType),
        padding: EdgeInsets.symmetric(
          horizontal: kPadding * 3,
          vertical: kPadding * 2,
        ),
        margin: const EdgeInsets.only(right: 8, left: 8, bottom: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  static Color _getSnackbarColor(SnackType type) {
    if (type == SnackType.error) return UIColors.dangerColor;
    if (type == SnackType.warning) return UIColors.warningColor;
    if (type == SnackType.info) return UIColors.infoColor;
    if (type == SnackType.success) return UIColors.successColor;
    return Colors.white;
  }

  static Color _getSnackbarTextColor(SnackType type) {
    if (type == SnackType.error || type == SnackType.info) return Colors.white;

    return const Color(0xff1C1C1C);
  }
}
