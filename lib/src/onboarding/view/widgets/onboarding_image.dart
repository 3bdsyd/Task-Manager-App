import 'package:flutter/material.dart';
import 'package:todo_app/core/gen/assets.gen.dart';

class OnBoardingImageWidget extends StatelessWidget {
  final double height;
  final LottieGenImage image;
  const OnBoardingImageWidget({
    super.key,
    required this.height,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return image.lottie(
      repeat: true,
      height: height < 750
          ? 200
          : height < 900
              ? 300
              : height < 1100
                  ? 400
                  : 500,
    );
  }
}
