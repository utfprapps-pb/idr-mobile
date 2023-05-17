import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:idr_mobile/core/theme/ui_config.dart';

class CustomOutlinedButton extends StatelessWidget {
  final VoidCallback onPressedCallBack;
  final String? title;
  final bool? titleInUppercase;
  final IconData? icon;
  final double? height;

  const CustomOutlinedButton({
    super.key,
    required this.onPressedCallBack,
    this.title,
    this.titleInUppercase = true,
    this.icon,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    String title = this.title ?? '';

    return SizedBox(
      height: height ?? 48,
      child: OutlinedButton(
        style: UIConfig.outlineButtonStyle,
        onPressed: onPressedCallBack,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon != null
                ? Icon(
                    icon,
                    size: 16,
                  )
                : Container(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                titleInUppercase! ? title.toUpperCase() : title,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
