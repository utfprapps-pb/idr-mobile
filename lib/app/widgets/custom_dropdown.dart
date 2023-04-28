import 'package:flutter/material.dart';
import 'package:idr_mobile/app/data/models/property_model.dart';
import 'package:idr_mobile/core/theme/ui_colors.dart';

class CustomDropdownButton<T> extends StatelessWidget {
  final List<T> items;
  final T selectedValue;
  final Function(T) onChanged;
  final String Function(T) itemText;

  CustomDropdownButton({
    required this.items,
    required this.selectedValue,
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
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: UIColors.primaryColor,
          width: 1.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: DropdownButton<T>(
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
        ),
      ),
    );
  }
}
