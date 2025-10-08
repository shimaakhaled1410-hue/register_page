
import 'package:flutter/material.dart';
import 'package:register_page/common/custom_text_field.dart';

class EmailField extends StatelessWidget {
  final TextEditingController controller;
  const EmailField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: controller,
      label: 'Email',
      icon: Icons.email_outlined,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      autofillHints: const [AutofillHints.email],
      hintText: 'Enter your email',
    );
  }
}
