import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/gen/colors.gen.dart';
import 'package:todo_app/core/styles/text_styles.dart';
import 'package:todo_app/src/onboarding/presenters/onboarding_provider.dart';
import 'package:todo_app/src/onboarding/view/widgets/onboarding_image.dart';

class OnBoardingPageViewWidget extends StatelessWidget {
  final double height;
  const OnBoardingPageViewWidget({
    super.key,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: Provider.of<OnBoardingProvider>(context).pageViewController,
      physics: const NeverScrollableScrollPhysics(),
      itemCount:
          Provider.of<OnBoardingProvider>(context).onBoardingItems.length,
      itemBuilder: (context, index) => Column(
        children: [
          OnBoardingImageWidget(
            height: height,
            image: Provider.of<OnBoardingProvider>(context)
                .onBoardingItems[index]
                .image,
          ).animate().slideY(
                delay: const Duration(milliseconds: 600),
                begin: -5,
                duration: const Duration(milliseconds: 600),
              ),
          const SizedBox(height: 40),
          Text(
            Provider.of<OnBoardingProvider>(context)
                .onBoardingItems[index]
                .title,
            textAlign: TextAlign.center,
            style: TextStyles.style30.copyWith(
              color: ColorName.deepBlue,
            ),
          ).animate().slideY(
                delay: const Duration(milliseconds: 600),
                begin: -5,
                duration: const Duration(milliseconds: 600),
              ),
          const SizedBox(height: 20),
          Text(
            Provider.of<OnBoardingProvider>(context)
                .onBoardingItems[index]
                .subTitle,
            textAlign: TextAlign.center,
            style: TextStyles.style16.copyWith(
              color: ColorName.coldGrey,
            ),
          ).animate().slideY(
                delay: const Duration(milliseconds: 600),
                begin: -5,
                duration: const Duration(milliseconds: 600),
              ),
        ],
      ),
    );
  }
}
