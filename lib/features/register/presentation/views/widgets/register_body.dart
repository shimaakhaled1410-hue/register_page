import 'package:flutter/material.dart';
import 'package:register_page/core/utils/styles.dart';
import 'package:register_page/features/register/presentation/views/widgets/register_text_fields.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({super.key});

  @override
  Widget build(BuildContext context) {
    // width and height of all screen
    final size = MediaQuery.of(context).size;
    // to know keyboard is open or close
    final isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;
    // secure from notch
    return SafeArea(
      // how much space the page is actually allowed 
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            // BouncingScrollPhysics => gives a smooth scrolling like iOS
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.06,
              vertical: isKeyboardVisible
                  ? size.height * 0.02
                  : size.height * 0.04,
            ),
            // ensure that page content is not smalller than entire screen
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              // make internal elements distributed according to actual height
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    SizedBox(height: size.height * 0.05),
                    Text(
                      'Sign Up to Trivio',
                      style: Styles.textStyle28.copyWith(
                        color: Colors.green[600],
                        fontSize: size.width * 0.08,
                      ),
                    ),
                    SizedBox(height: size.height * 0.04),
                    const RegisterTextFields(),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
