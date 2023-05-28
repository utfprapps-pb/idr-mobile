import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idr_mobile/core/theme/ui_colors.dart';

class UIConfig {
  UIConfig._();

  static String get title => 'IDR Mobile App';

  static ThemeData get theme => ThemeData(
        fontFamily: 'Segoe-UI',
        primaryColor: UIColors.primaryColor,
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: UIColors.primaryColor,
            ),
      );

  static ButtonStyle get elevatedButtonStyle => ElevatedButton.styleFrom(
        backgroundColor: UIColors.primaryColor,
        maximumSize: Size(Get.width, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      );

  static ButtonStyle get outlineButtonStyle => OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        side:
            const BorderSide(color: Color(0xFF0059AA), width: 1), //<-- SEE HERE
        textStyle: TextStyle(
          color: UIColors.blackColor,
        ),
      );

  static TextStyle get titleStyle => TextStyle(
        color: UIColors.blackColor24,
        fontFamily: 'Segoe-UI',
        fontSize: 24,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.25,
      );

  static TextStyle get textStyle => TextStyle(
        color: UIColors.blackColor24,
        fontFamily: 'Segoe-UI',
        fontSize: 16,
        fontWeight: FontWeight.normal,
        letterSpacing: 0.5,
      );

  static TextStyle get subtitleStyle => TextStyle(
        color: UIColors.blackColor24,
        fontFamily: 'Segoe-UI',
        fontSize: 16,
        letterSpacing: 0.15,
        fontWeight: FontWeight.w400,
      );

  static TextStyle get textHeadStyle => TextStyle(
        color: UIColors.blackColor24,
        fontFamily: 'Segoe-UI',
        fontSize: 18,
        fontWeight: FontWeight.bold,
        letterSpacing: 0.5,
      );
}
