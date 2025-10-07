
import 'package:flutter/material.dart';

class PasswordVisibilityIcon extends StatelessWidget {
  final bool isObscured;
  final VoidCallback onToggle;

  const PasswordVisibilityIcon({
    super.key,
    required this.isObscured,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onToggle,
      icon: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        transitionBuilder: (child, animation) =>
            FadeTransition(opacity: animation, child: child),
        child: Icon(
          isObscured ? Icons.visibility_off : Icons.visibility,
          key: ValueKey<bool>(isObscured),
          color: Colors.grey[600],
        ),
      ),
      tooltip: isObscured ? 'Show password' : 'Hide password',
    );
  }
}
