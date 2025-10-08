import 'package:flutter/material.dart';
import 'package:register_page/common/custom_text_field.dart';
import 'package:register_page/core/validators/username_validator.dart';

class UsernameField extends StatefulWidget {
  final TextEditingController controller;
  const UsernameField({super.key, required this.controller});

  @override
  State<UsernameField> createState() => _UsernameFieldState();
}

class _UsernameFieldState extends State<UsernameField> {
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_validate);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_validate);
    super.dispose();
  }

  void _validate() {
    final error = UsernameValidator.errorMessage(widget.controller.text);
    if (error != errorMessage) {
      setState(() => errorMessage = error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextField(
          controller: widget.controller,
          label: 'Username',
          icon: Icons.person_outline,
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.next,
          autofillHints: const [AutofillHints.username],
          hintText: 'Enter your username',
        ),
        const SizedBox(height: 4),
        if (errorMessage != null)
          Text(
            errorMessage!,
            style: const TextStyle(color: Colors.red, fontSize: 10),
          ),
      ],
    );
  }
}
