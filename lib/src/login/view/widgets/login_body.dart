import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/core/gen/colors.gen.dart';
import 'package:todo_app/core/styles/text_styles.dart';
import 'package:todo_app/src/login/view/widgets/login_button.dart';
import 'package:todo_app/src/login/view/widgets/login_button_register.dart';
import 'package:todo_app/src/login/view/widgets/login_forms.dart';
import 'package:todo_app/src/login/view/widgets/login_or_text.dart';

class LoginBodyWidget extends StatelessWidget {
  const LoginBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                const SizedBox(height: 60),
                AnimatedTextKit(
                  animatedTexts: [
                    WavyAnimatedText(
                      'Welcome back',
                      textStyle: TextStyles.style30,
                    ),
                  ],
                  isRepeatingAnimation: true,
                  repeatForever: false,
                  totalRepeatCount: 1,
                ),
                const SizedBox(height: 50),
                const LoginFormWidget(),
                const SizedBox(height: 25),
                Text(
                  'Forgot your password?',
                  style: TextStyles.style12.copyWith(
                    fontWeight: FontWeight.w500,
                    color: ColorName.purplePlum,
                    decoration: TextDecoration.underline,
                    decorationColor: ColorName.purplePlum,
                  ),
                ),
                const Expanded(
                  child: SizedBox(height: 20),
                ),
                const LoginButtonWidget(),
                const SizedBox(height: 20),
                const LoginOrTextWidget(),
                const SizedBox(height: 20),
                const LoginButtonRegisterWidget(),
                const SizedBox(height: 40),
              ],
            ),
          )
        ],
      ),
    );
  }
}
