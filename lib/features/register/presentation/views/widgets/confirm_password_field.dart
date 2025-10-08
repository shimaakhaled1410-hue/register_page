
import 'package:flutter/material.dart';
import 'package:register_page/common/custom_text_field.dart';
import 'password_match_text.dart';

class ConfirmPasswordField extends StatelessWidget {
  final TextEditingController controller;
  final bool passwordsMatch;
  final VoidCallback onChanged;

  const ConfirmPasswordField({
    super.key,
    required this.controller,
    required this.passwordsMatch,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextField(
          controller: controller,
          label: 'Confirm Password',
          hiddenText: true,
          icon: Icons.lock_outline,
          textInputAction: TextInputAction.done,
          autofillHints: const [AutofillHints.password],
          hintText: 'Confirm your password',
          onChanged: (_) => onChanged(),
        ),
        const SizedBox(height: 4),
        PasswordMatchText(
          show: controller.text.isNotEmpty,
          passwordsMatch: passwordsMatch,
        ),
      ],
    );
  }
}
