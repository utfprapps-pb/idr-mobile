import 'package:flutter/material.dart';
import 'package:idr_mobile/app/data/models/property_model.dart';
import 'package:idr_mobile/core/theme/ui_colors.dart';

class CustomDropdownButton<T> extends StatelessWidget {
  final List<T> items;
  final T selectedValue;
  final String? label;
  final Function(T) onChanged;
  final String Function(T) itemText;

  CustomDropdownButton({
    required this.items,
    required this.selectedValue,
    this.label,
    required this.onChanged,
    this.itemText = _defaultItemText,
  });

  static String _defaultItemText(dynamic item) {
    if (item is String) {
      return item;
    }
    if (item is Map<String, dynamic>) {
      return item['name'];
    }
    if (item is PropertyModel) {
      return item.getNamed();
    }
    return item.toString();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      decoration: InputDecoration(
        filled: true,
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: UIColors.primaryColor,
            width: 2,
            strokeAlign: 1,
            style: BorderStyle.solid,
          ),
        ),
      ),
      value: selectedValue,
      icon: Icon(
        Icons.arrow_drop_down,
        color: UIColors.primaryColor,
      ),
      iconSize: 24.0,
      elevation: 16,
      style: TextStyle(
        color: UIColors.primaryColor,
        fontSize: 16.0,
      ),
      isExpanded: true,
      alignment: Alignment.centerRight,
      // onChanged: onChanged(newObject()),
      onChanged: (newValue) => onChanged(newValue as T),
      items: items.map<DropdownMenuItem<T>>((T value) {
        return DropdownMenuItem<T>(
          value: value,
          child: Text(
            _defaultItemText(value),
            style: TextStyle(
              color: UIColors.primaryColor,
              fontSize: 16.0,
            ),
          ),
        );
      }).toList(),
    );
  }
}
