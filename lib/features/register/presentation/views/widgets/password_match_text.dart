import 'package:flutter/material.dart';

class PasswordMatchText extends StatelessWidget {
  final bool show;
  final bool passwordsMatch;

  const PasswordMatchText({
    super.key,
    required this.show,
    required this.passwordsMatch,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: show ? 1 : 0,
      duration: const Duration(milliseconds: 300),
      child: Text(
        passwordsMatch ? 'Passwords match' : 'Passwords do not match',
        style: TextStyle(
          color: passwordsMatch ? Colors.green[600] : Colors.red,
          fontSize: 14,
        ),
      ),
    );
  }
}
