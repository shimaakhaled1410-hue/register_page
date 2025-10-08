
import 'package:flutter/material.dart';
import 'package:register_page/common/custom_text_field.dart';
import 'password_strength_indecator.dart';

class PasswordField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onChanged;
  const PasswordField({super.key, required this.controller, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextField(
          controller: controller,
          label: 'Password',
          hiddenText: true,
          icon: Icons.lock_outline,
          hintText: 'Enter your password',
          textInputAction: TextInputAction.next,
          autofillHints: const [AutofillHints.password],
          onChanged: (_) => onChanged(),
        ),
        PasswordStrengthIndicator(password: controller.text),
      ],
    );
  }
}
