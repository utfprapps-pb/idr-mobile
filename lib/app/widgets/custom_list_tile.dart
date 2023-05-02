import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final String content;
  final IconData? icon;

  const CustomListTile({
    super.key,
    required this.title,
    required this.content,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon != null ? Icon(icon) : null,
      title: Text(title),
      subtitle: Text(content),
      // trailing: const Icon(Icons.more_vert),
    );
  }
}
