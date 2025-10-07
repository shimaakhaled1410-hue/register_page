import 'package:flutter/material.dart';
import 'functions/build_input_decoration.dart';
import '../features/register/presentation/views/widgets/password_visibility_icon.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final bool hiddenText;
  final IconData? icon;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Iterable<String>? autofillHints;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final String? hintText;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    this.hiddenText = false,
    this.icon,
    this.keyboardType,
    this.textInputAction,
    this.autofillHints,
    this.onChanged,
    this.onSubmitted,
    this.hintText,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _obscure;

  @override
  void initState() {
    super.initState();
    _obscure = widget.hiddenText;
  }

  void _toggleObscure() {
    setState(() => _obscure = !_obscure);
  }

  @override
  Widget build(BuildContext context) {
    final suffix = widget.hiddenText
        ? PasswordVisibilityIcon(isObscured: _obscure, onToggle: _toggleObscure)
        : null;

    final isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDark ? Colors.grey[850] : Colors.grey[200];
    final textColor = isDark ? Colors.white : Colors.black87;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: widget.controller,
        obscureText: _obscure,
        keyboardType: widget.keyboardType,
        textInputAction: widget.textInputAction,
        autofillHints: widget.autofillHints,
        onChanged: widget.onChanged,
        onSubmitted: widget.onSubmitted,
        style: TextStyle(color: textColor),
        decoration:
            buildInputDecoration(
              label: widget.label,
              prefixIcon: widget.icon,
              suffixIcon: suffix,
              hintText: widget.hintText,
            ).copyWith(
              filled: true,
              fillColor: backgroundColor,
              labelStyle: TextStyle(
                color: isDark ? Colors.grey[300] : Colors.grey[700],
              ),
              hintStyle: TextStyle(
                color: isDark ? Colors.grey[400] : Colors.grey[500],
              ),
            ),
      ),
    );
  }
}
