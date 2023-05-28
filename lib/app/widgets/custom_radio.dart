import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:idr_mobile/core/theme/ui_colors.dart';

class CustomRadio extends StatelessWidget {
  final String value;
  final String groupValue;
  final void Function(String?)? onChanged;

  const CustomRadio({
    Key? key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Radio(
      fillColor:
          MaterialStateColor.resolveWith((states) => UIColors.primaryColor),
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
    );
  }
}
