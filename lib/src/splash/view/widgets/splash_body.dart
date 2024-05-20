import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:todo_app/core/gen/assets.gen.dart';
import 'package:todo_app/core/gen/colors.gen.dart';
import 'package:todo_app/core/router/app_router.gr.dart';
import 'package:todo_app/core/styles/text_styles.dart';
import 'package:todo_app/shared/widgets/custom_button.dart';

class SplashBodyWidget extends StatelessWidget {
  const SplashBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Assets.icons.logo.svg().animate().fade().scale(
              delay: const Duration(milliseconds: 1200),
              duration: const Duration(milliseconds: 400),
            ),
        Text(
          'Welcome To\nTask Manager App',
          textAlign: TextAlign.center,
          style: TextStyles.style30.copyWith(
            color: ColorName.deepBlue,
          ),
        ).animate().slideX(
              delay: const Duration(milliseconds: 400),
              begin: -2,
              duration: const Duration(milliseconds: 500),
            ),
        const SizedBox(height: 20),
        Text(
          'Just take a look and take action!',
          style: TextStyles.style16.copyWith(
            color: ColorName.coldGrey,
          ),
        ).animate().slideX(
              begin: 2,
              delay: const Duration(milliseconds: 900),
              duration: const Duration(milliseconds: 600),
            ),
        const Spacer(),
        CustomButtonWidget(
          title: 'Let’s start',
          onTap: () {
            context.router.push(const OnBoardingView());
          },
        ).animate().slideY(
              begin: 1,
              duration: const Duration(milliseconds: 600),
            ),
        const SizedBox(height: 20),
      ],
    );
  }
}
