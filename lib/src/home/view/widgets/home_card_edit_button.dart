import 'package:flutter/material.dart';
import 'package:todo_app/core/gen/assets.gen.dart';
import 'package:todo_app/core/gen/colors.gen.dart';

class HomeCardEditButtonWidget extends StatelessWidget {
  const HomeCardEditButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 25,
      height: 25,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: ColorName.deepBlue,
        shape: BoxShape.circle,
      ),
      child: Assets.icons.edit.svg(
        fit: BoxFit.scaleDown,
        width: 10,
        height: 10,
        colorFilter: const ColorFilter.mode(ColorName.white, BlendMode.srcIn),
      ),
    );
  }
}
