import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:idr_mobile/core/theme/ui_colors.dart';

class CustomInputField extends StatelessWidget {
  final FocusNode? inputFocus;
  final TextEditingController inputController;
  final VoidCallback onTapCallBack;
  final String labelText;
  final IconData? icon;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool? isObbscureText;
  final bool? isEnable;
  final String? Function(String?)? validator;

  const CustomInputField({
    super.key,
    this.inputFocus,
    required this.inputController,
    required this.onTapCallBack,
    required this.labelText,
    this.icon,
    this.keyboardType,
    this.inputFormatters,
    this.isObbscureText,
    this.isEnable,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: inputController,
      style: TextStyle(
        color: UIColors.blackColor,
        fontSize: 16,
      ),
      focusNode: inputFocus,
      onTap: () => onTapCallBack,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters ?? [],
      obscureText: isObbscureText ?? false,
      cursorColor: UIColors.primaryColor,
      decoration: InputDecoration(
          // constraints: BoxConstraints(minHeight: 50),
          isDense: true,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
          labelText: labelText,
          labelStyle: TextStyle(
            color: UIColors.primaryColor,
          ),
          suffixIcon: icon != null
              ? Icon(
                  icon,
                  color: UIColors.primaryColor,
                  size: 20,
                )
              : null,
          // errorBorder: OutlineInputBorder(
          //   borderSide: BorderSide(
          //     color: UIColors.dangerColor,
          //     width: 1,
          //   ),
          //   borderRadius: BorderRadius.circular(10),
          // ),
          // focusedErrorBorder: OutlineInputBorder(
          //   borderSide: BorderSide(
          //     color: UIColors.primaryColor,
          //     width: 1,
          //   ),
          //   borderRadius: BorderRadius.circular(10),
          // ),
          // enabledBorder: OutlineInputBorder(
          //   borderSide: BorderSide(
          //     color: UIColors.primaryColor,
          //     width: 1,
          //   ),
          //   borderRadius: BorderRadius.circular(10),
          // ),
          // disabledBorder: OutlineInputBorder(
          //   borderSide: BorderSide(
          //     color: UIColors.disableColor,
          //     width: 1,
          //   ),
          //   borderRadius: BorderRadius.circular(10),
          // ),
          // focusedBorder: OutlineInputBorder(
          //   borderSide: BorderSide(
          //     color: UIColors.primaryColor,
          //     width: 1.5,
          //   ),
          //   borderRadius: BorderRadius.circular(10),
          // ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: UIColors.primaryColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          enabled: isEnable ?? true,
          fillColor: UIColors.dangerColor),
    );
  }
}
