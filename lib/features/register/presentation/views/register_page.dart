import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:register_page/common/custom_snackbar.dart';
import 'package:register_page/features/register/presentation/manager/register_cubit/cubit/register_cubit.dart';
import 'package:register_page/features/register/presentation/views/widgets/register_body.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterLoading) {
            CustomSnackBar.show(context, 'Registering...', success: true);
          } else if (state is RegisterSuccess) {
            context.go('/homePage');
            // CustomSnackBar.show(
            //   context,
            //   'Registration successful',
            //   success: true,
            // );
          } else if (state is RegisterFailure) {
            CustomSnackBar.show(context, state.message, success: false);
          }
        },
        child: const RegisterBody(),
      ),
    );
  }
}
