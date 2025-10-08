
import 'package:flutter/material.dart';

class CustomSnackBar {
  static void show(BuildContext context, String message,
      {bool success = true}) {
    final snackBar = SnackBar(
      content: Row(
        children: [
          Icon(
            success ? Icons.check_circle : Icons.error,
            color: Colors.white,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      backgroundColor: success ? Colors.green[600] : Colors.red[600],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      duration: const Duration(seconds: 3),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
