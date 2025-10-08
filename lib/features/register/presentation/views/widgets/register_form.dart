import 'package:flutter/material.dart';
import 'package:register_page/features/register/presentation/views/widgets/confirm_password_field.dart';
import 'package:register_page/features/register/presentation/views/widgets/register_account_button.dart';
import 'package:register_page/features/register/presentation/views/widgets/email_field.dart';
import 'package:register_page/features/register/presentation/views/widgets/password_field.dart';
import 'package:register_page/features/register/presentation/views/widgets/username_field.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool passwordsMatch = false;

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
        UsernameField(controller: usernameController),
        SizedBox(height: verticalSpacing / 2),
        EmailField(controller: emailController),
        SizedBox(height: verticalSpacing),
        PasswordField(controller: passwordController, onChanged: _updatePasswordMatch),
        ConfirmPasswordField(
          controller: confirmPasswordController,
          passwordsMatch: passwordsMatch,
          onChanged: _updatePasswordMatch,
        ),
        SizedBox(height: verticalSpacing * 1.5),
        RegisterAccountButton(
          usernameController: usernameController,
          emailController: emailController,
          passwordController: passwordController,
          passwordsMatch: passwordsMatch,
        ),
      ],
    );
  }
}
