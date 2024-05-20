import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/gen/colors.gen.dart';
import 'package:todo_app/src/onboarding/presenters/onboarding_provider.dart';

class OnBoardingTransitionIndicatorWidget extends StatelessWidget {
  final double width;
  const OnBoardingTransitionIndicatorWidget({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        3,
        (index) => Consumer<OnBoardingProvider>(
          builder: (
            BuildContext context,
            OnBoardingProvider onBoardingProvider,
            Widget? child,
          ) =>
              AnimatedContainer(
            constraints: const BoxConstraints(maxWidth: 100),
            margin: const EdgeInsets.only(right: 5, bottom: 20, top: 40),
            decoration: BoxDecoration(
              color: index == onBoardingProvider.currentPage
                  ? ColorName.purplePlum
                  : ColorName.lightGrey,
              borderRadius: BorderRadius.circular(5),
            ),
            width: index == onBoardingProvider.currentPage
                ? width / 4
                : width /
                    (4 + (index - onBoardingProvider.currentPage).abs() * 3),
            height: 4,
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeIn,
          ).animate().slideX(
                    begin: -5,
                    duration: const Duration(milliseconds: 600),
                  ),
        ),
      ),
    );
  }
}
