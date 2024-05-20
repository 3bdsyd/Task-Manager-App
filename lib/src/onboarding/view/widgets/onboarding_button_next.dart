import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/gen/assets.gen.dart';
import 'package:todo_app/core/gen/colors.gen.dart';
import 'package:todo_app/src/onboarding/presenters/onboarding_provider.dart';

class OnBoardingButtonNextWidget extends StatelessWidget {
  final double height;
  final Function() onTap;
  const OnBoardingButtonNextWidget({
    super.key,
    required this.height,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height < 750 ? 66 : 88,
      width: height < 750 ? 66 : 88,
      child: ElevatedButton(
        key: Provider.of<OnBoardingProvider>(context).globalKey2,
        onPressed: onTap,
        style: ButtonStyle(
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          foregroundColor: const MaterialStatePropertyAll(ColorName.white),
          backgroundColor: const MaterialStatePropertyAll(ColorName.purplePlum),
        ),
        child: Assets.icons.arrowLongRight.svg(
          colorFilter: const ColorFilter.mode(
            ColorName.white,
            BlendMode.srcIn,
          ),
        ),
      ),
    ).animate().slideX(
          delay: const Duration(milliseconds: 1200),
          begin: -5,
          duration: const Duration(milliseconds: 600),
        );
  }
}
