import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:register_page/common/custom_button.dart';
import 'package:register_page/common/custom_snackbar.dart';
import 'package:register_page/core/validators/email_validator.dart';
import 'package:register_page/core/validators/password_validator.dart';
import 'package:register_page/core/validators/username_validator.dart';
import 'package:register_page/features/register/domain/params/user_params.dart';
import '../../manager/register_cubit/cubit/register_cubit.dart';

class RegisterAccountButton extends StatelessWidget {
  final TextEditingController usernameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool passwordsMatch;

  const RegisterAccountButton({
    super.key,
    required this.usernameController,
    required this.emailController,
    required this.passwordController,
    required this.passwordsMatch,
  });

  void _onPressed(BuildContext context) {
    final username = usernameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (username.isEmpty || email.isEmpty || password.isEmpty) {
      CustomSnackBar.show(context, 'Please fill in all fields', success: false);
      return;
    }
    final usernameError = UsernameValidator.errorMessage(username);
    if (usernameError != null) {
      CustomSnackBar.show(context, usernameError, success: false);
      return;
    }
    final emailError = EmailValidator.errorMessage(email);
    if (emailError != null) {
      CustomSnackBar.show(context, emailError, success: false);
      return;
    }
    if (!PasswordValidator.isStrong(password)) {
      CustomSnackBar.show(
        context,
        'Password must be 8+ chars, include uppercase, number & special char',
        success: false,
      );
      return;
    }
    if (!passwordsMatch) {
      CustomSnackBar.show(context, 'Passwords do not match', success: false);
      return;
    }

    context.read<RegisterCubit>().register(
      UserParams(username: username, email: email, password: password),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      text: 'Create my account',
      onPressed: () => _onPressed(context),
    );
  }
}
