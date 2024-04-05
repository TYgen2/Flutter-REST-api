import 'package:flutter/material.dart';

void showErrorMessage(
  BuildContext context, {
  required String message,
}) {
  final snackBar = SnackBar(
    content: Text(
      message,
      style: const TextStyle(
        color: Colors.black,
      ),
    ),
    backgroundColor: Colors.redAccent[100],
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

void showSuccessMessage(
  BuildContext context, {
  required String message,
}) {
  final snackBar = SnackBar(
    content: Text(
      message,
      style: const TextStyle(
        color: Colors.black,
      ),
    ),
    backgroundColor: Colors.greenAccent[100],
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
