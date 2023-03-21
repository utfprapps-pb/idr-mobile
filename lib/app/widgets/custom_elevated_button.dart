import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:idr_mobile/core/theme/ui_config.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressedCallBack;
  final String? title;
  final IconData? icon;
  final double? height;

  const CustomElevatedButton({
    super.key,
    required this.onPressedCallBack,
    this.title,
    this.icon,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 48,
      child: ElevatedButton(
        style: UIConfig.elevatedButtonStyle,
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
              child: Text(title ?? ''),
            ),
          ],
        ),
      ),
    );
  }
}
