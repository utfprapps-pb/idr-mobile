import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:idr_mobile/core/theme/ui_colors.dart';

class SideMenuTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final GestureTapCallback onTap;
  final bool isSelected;

  const SideMenuTile({
    Key? key,
    required this.icon,
    required this.text,
    required this.onTap,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
          color: isSelected ? UIColors.primaryColor : Colors.transparent,
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          )),
      child: ListTile(
        selected: true,
        trailing: Icon(
          icon,
          color: isSelected ? UIColors.whiteColor : UIColors.primaryColor,
        ),
        title: Text(
          text,
          style: TextStyle(
            color: isSelected ? UIColors.whiteColor : UIColors.primaryColor,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
