import 'package:flutter/material.dart';

class MainDialog {
  final BuildContext context;
  final String title;
  final String content;

  MainDialog(
    this.context, {
    required this.title,
    required this.content,
  });

  showAlertDialog() {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text(
                title,
              ),
              content: Text(
                content,
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('OK'),
                ),
              ],
            ));
  }
}
