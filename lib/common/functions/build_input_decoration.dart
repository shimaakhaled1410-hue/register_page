import 'package:flutter/material.dart';
import 'package:register_page/core/utils/constants.dart';

InputDecoration buildInputDecoration({
  required String label,
  IconData? prefixIcon,
  Widget? suffixIcon,
  String? hintText,
}) {
  return InputDecoration(
    prefixIcon: prefixIcon != null
        ? Icon(prefixIcon, color: Constants.primaryLight)
        : null,
    labelText: label,
    hintText: hintText,
    labelStyle: const TextStyle(color: Constants.label),
    filled: true,
    fillColor: Constants.fieldFill,
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Constants.borderFocused, width: 1.5),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Constants.borderEnabled, width: 1.2),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    suffixIcon: suffixIcon,
  );
}
