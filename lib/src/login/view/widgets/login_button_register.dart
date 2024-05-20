import 'package:flutter/material.dart';
import 'package:todo_app/core/gen/colors.gen.dart';
import 'package:todo_app/core/styles/text_styles.dart';

class LoginButtonRegisterWidget extends StatelessWidget {
  const LoginButtonRegisterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'Don’t have an account yet? ',
            style: TextStyles.style12.copyWith(color: ColorName.black),
          ),
          TextSpan(
            text: 'Sign up',
            style: TextStyles.style12.copyWith(color: ColorName.purplePlum),
          ),
        ],
      ),
    );
  }
}
