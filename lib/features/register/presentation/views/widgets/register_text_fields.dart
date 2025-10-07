import 'package:flutter/material.dart';
import 'package:register_page/common/custom_button.dart';
import 'package:register_page/common/custom_text_field.dart';
import 'package:register_page/features/register/presentation/views/widgets/password_strength_indecator.dart';
import '../../../../../core/validators/username_validator.dart';
import 'password_match_text.dart';

class RegisterTextFields extends StatefulWidget {
  const RegisterTextFields({super.key});

  @override
  State<RegisterTextFields> createState() => _RegisterTextFieldsState();
}

class _RegisterTextFieldsState extends State<RegisterTextFields> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool passwordsMatch = false;

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void _updatePasswordMatch() {
    setState(() {
      passwordsMatch =
          passwordController.text == confirmPasswordController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final verticalSpacing = size.height * 0.02;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Username field + error
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              controller: usernameController,
              label: 'Username',
              icon: Icons.person_outline,
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              autofillHints: const [AutofillHints.username],
              hintText: 'Enter your username',
              onChanged: (_) => setState(() {}),
            ),
            // const SizedBox(height: 4),
            SizedBox(
              height: 12,
              child:
                  UsernameValidator.errorMessage(usernameController.text) !=
                      null
                  ? Text(
                      UsernameValidator.errorMessage(usernameController.text)!,
                      style: const TextStyle(color: Colors.red, fontSize: 10),
                    )
                  : null,
            ),
          ],
        ),
        SizedBox(height: verticalSpacing / 2),

        // Email field
        CustomTextField(
          controller: emailController,
          label: 'Email',
          icon: Icons.email_outlined,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          autofillHints: const [AutofillHints.email],
          hintText: 'Enter your email',
        ),
        SizedBox(height: verticalSpacing),

        // Password field + strength indicator
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              controller: passwordController,
              label: 'Password',
              hiddenText: true,
              icon: Icons.lock_outline,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              autofillHints: const [AutofillHints.password],
              hintText: 'Enter your password',
              onChanged: (_) => _updatePasswordMatch(),
            ),
            // const SizedBox(height: 4),
            PasswordStrengthIndicator(password: passwordController.text),
          ],
        ),
        // SizedBox(height: verticalSpacing/4),

        // Confirm password field + match text
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              controller: confirmPasswordController,
              label: 'Confirm Password',
              hiddenText: true,
              icon: Icons.lock_outline,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              autofillHints: const [AutofillHints.password],
              hintText: 'Confirm your password',
              onChanged: (_) => _updatePasswordMatch(),
            ),
            const SizedBox(height: 4),
            PasswordMatchText(
              show: confirmPasswordController.text.isNotEmpty,
              passwordsMatch: passwordsMatch,
            ),
          ],
        ),
        SizedBox(height: verticalSpacing * 1.5),

        // Create account button
        CustomButton(
          text: 'Create my account',
          onPressed: () {
            // handle register action
          },
        ),
        SizedBox(height: verticalSpacing * 0.8),

        // Sign in link
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Already have an account? "),
            GestureDetector(
              onTap: () {
                // navigate to Sign In page
              },
              child: Text(
                "Sign In",
                style: TextStyle(
                  color: Colors.green[600],
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
