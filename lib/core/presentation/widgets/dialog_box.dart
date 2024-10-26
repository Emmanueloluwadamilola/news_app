import 'package:flutter/material.dart';
import 'package:news_app/core/presentation/theme/color.dart';

class DeleteDialog extends StatelessWidget {
  const DeleteDialog(
      {super.key,
      required this.delete,
      required this.title,
      required this.actionText});
  final VoidCallback delete;
  final String title;
  final String actionText;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AlertDialog(
      backgroundColor: backgroundColor,
      content: Text(
        title,
        style: theme.textTheme.bodyLarge!.copyWith(
          fontSize: 18,
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Cancel',
              style: TextStyle(fontSize: 18, color: Colors.black),
            )),
        TextButton(
          onPressed: delete,
          child: Text(
            actionText,
            style: const TextStyle(fontSize: 18, color: Colors.red),
          ),
        ),
      ],
    );
  }
}
