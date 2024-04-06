import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

Future<bool?> showDeleteConfirmDialog(BuildContext context) {
  return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Alert'),
          content: const Text('Are you sure to delete the current tile?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: const Text('Yes'),
            ),
          ],
        );
      });
}

void showDeleteSuccess(BuildContext context) {
  toastification.show(
    context: context,
    type: ToastificationType.success,
    style: ToastificationStyle.flat,
    autoCloseDuration: const Duration(seconds: 3),
    title: const Text('Successfully deleted!'),
    alignment: Alignment.bottomCenter,
  );
}
