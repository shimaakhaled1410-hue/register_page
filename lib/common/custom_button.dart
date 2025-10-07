import 'package:flutter/material.dart';
import 'package:register_page/core/utils/styles.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? color;
  final double borderRadius;
  final double height;
  final TextStyle? textStyle;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color,
    this.borderRadius = 12,
    this.height = 52,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    final buttonColor = color ?? Colors.green[600];
    final style =
        textStyle ??
        Styles.textStyle18.copyWith(
          color: Colors.white,
          letterSpacing: 0.5,
          fontWeight: FontWeight.w600,
        );

    return SizedBox(
      width: double.infinity,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          elevation: 3, // Slight elevation for subtle shadow
          shadowColor: buttonColor?.withOpacity(0.3),
        ),
        onPressed: onPressed,
        child: Text(text, style: style),
      ),
    );
  }
}
