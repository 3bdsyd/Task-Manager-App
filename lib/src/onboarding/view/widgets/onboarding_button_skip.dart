import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/gen/colors.gen.dart';
import 'package:todo_app/core/styles/text_styles.dart';
import 'package:todo_app/src/onboarding/presenters/onboarding_provider.dart';

class OnBoardingButtonSkip extends StatelessWidget {
  const OnBoardingButtonSkip({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        splashColor: ColorName.lightGrey,
        onTap: () => Provider.of<OnBoardingProvider>(context, listen: false)
            .skipToNextPages(),
        child: Container(
          key: Provider.of<OnBoardingProvider>(context).globalKey1,
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: ColorName.purplePlum),
          ),
          child: Text(
            'Skip Intro',
            style: TextStyles.style12.copyWith(
              color: ColorName.purplePlum,
            ),
          ),
        ),
      ),
    );
  }
}
