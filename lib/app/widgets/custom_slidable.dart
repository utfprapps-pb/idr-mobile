import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:idr_mobile/app/widgets/custom_list_tile.dart';
import 'package:idr_mobile/core/theme/ui_colors.dart';

class CustomSlidable extends StatelessWidget {
  final String title;
  final String content;
  final int? identity;
  final IconData? icon;
  final void Function(BuildContext)? onPressedRemoveCallBack;
  final void Function(BuildContext)? onPressedEditCallBack;
  // final Icon
  const CustomSlidable({
    super.key,
    required this.title,
    required this.content,
    required this.onPressedRemoveCallBack,
    required this.onPressedEditCallBack,
    this.icon,
    this.identity,
  });

  @override
  Widget build(BuildContext context) {
    //Docs: https://pub.dev/packages/flutter_slidable
    return Slidable(
      // Specify a key if the Slidable is dismissible.
      key: identity != null ? ValueKey(identity) : const ValueKey(0),
      // The end action pane is the one at the right or the bottom side.
      endActionPane: ActionPane(
        motion: ScrollMotion(),
        children: [
          SlidableAction(
            // An action can be bigger than the others.
            flex: 1,
            onPressed: onPressedRemoveCallBack,
            backgroundColor: UIColors.dangerColor,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Remover',
          ),
          SlidableAction(
            flex: 1,
            onPressed: onPressedEditCallBack,
            backgroundColor: UIColors.primaryColor,
            foregroundColor: Colors.white,
            icon: Icons.edit,
            label: 'Editar',
          ),
        ],
      ),
      child: CustomListTile(title: title, content: content, icon: icon),
    );
  }
}
