import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idr_mobile/core/theme/ui_colors.dart';

class UIConfig {
  UIConfig._();

  static String get title => 'IDR Mobile App';

  static ThemeData get theme => ThemeData(
        fontFamily: 'Segoe-UI',
        // colorScheme: ThemeData().colorScheme.copyWith(secondary: Colors.white),
      );

  static ButtonStyle get elevatedButtonStyle => ElevatedButton.styleFrom(
        backgroundColor: UIColors.primaryColor,
        maximumSize: Size(Get.width, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      );

  static ButtonStyle get outlineButtonStyle => OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        side:
            const BorderSide(color: Color(0xFF0059AA), width: 1), //<-- SEE HERE
        textStyle: TextStyle(
          color: UIColors.blackColor,
        ),
      );
}
