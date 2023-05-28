import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:idr_mobile/core/theme/ui_colors.dart';

class CustomInputField extends StatelessWidget {
  final FocusNode? inputFocus;
  final TextEditingController inputController;
  final VoidCallback onTapCallBack;
  final VoidCallback? onPressedIcon;
  final String labelText;
  final IconData? icon;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool? isObscureText;
  final bool? isEnable;
  final String? Function(String?)? validator;
  final Function(String s)? onSaved;
  final Function(String s)? onValidate;
  final Function(String s)? onChanged;
  final int? maxLines;

  const CustomInputField({
    super.key,
    this.inputFocus,
    required this.inputController,
    required this.onTapCallBack,
    this.onPressedIcon,
    required this.labelText,
    this.icon,
    this.keyboardType,
    this.inputFormatters,
    this.isObscureText,
    this.isEnable,
    this.validator,
    this.onChanged,
    this.onSaved,
    this.onValidate,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      onSaved: (v) => onSaved!(v!),
      // validator: (v) => onValidate!(v!),
      validator: validator,
      maxLines: maxLines ?? 1,
      controller: inputController,
      style: TextStyle(
        color: UIColors.blackColor,
        fontSize: 16,
      ),
      focusNode: inputFocus,
      onTap: () => onTapCallBack,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters ?? [],
      obscureText: isObscureText ?? false,
      cursorColor: UIColors.primaryColor,
      decoration: InputDecoration(
          isDense: true,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 18.0, horizontal: 10.0),
          labelText: labelText,
          labelStyle: TextStyle(
            color: UIColors.primaryColor,
          ),
          suffixIcon: onPressedIcon != null
              ? IconButton(
                  onPressed: onPressedIcon,
                  icon: Icon(
                    icon,
                    color: UIColors.primaryColor,
                    size: 20,
                  ))
              : icon != null
                  ? Icon(
                      icon,
                      color: UIColors.primaryColor,
                      size: 20,
                    )
                  : null,
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: UIColors.dangerColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: UIColors.primaryColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: UIColors.primaryColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: UIColors.disableColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: UIColors.primaryColor,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: UIColors.primaryColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          enabled: isEnable ?? true,
          fillColor: UIColors.dangerColor),
    );
  }
}
