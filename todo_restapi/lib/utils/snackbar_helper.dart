import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

void showErrorMessage(BuildContext context, String message) {
  toastification.show(
    context: context,
    type: ToastificationType.error,
    style: ToastificationStyle.flatColored,
    autoCloseDuration: const Duration(seconds: 3),
    title: Text(message),
    alignment: Alignment.bottomCenter,
  );
}

void showSuccessMessage(BuildContext context, String message) {
  toastification.show(
    context: context,
    type: ToastificationType.success,
    style: ToastificationStyle.flatColored,
    autoCloseDuration: const Duration(seconds: 3),
    title: Text(message),
    alignment: Alignment.bottomCenter,
  );
}
