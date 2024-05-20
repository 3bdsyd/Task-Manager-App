import 'package:flutter/material.dart';
import 'package:todo_app/core/gen/assets.gen.dart';
import 'package:todo_app/core/gen/colors.gen.dart';

class HomeCardDeletedButton extends StatelessWidget {
  const HomeCardDeletedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 25,
      height: 25,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: Colors.redAccent,
        shape: BoxShape.circle,
      ),
      child: Assets.icons.delete.image(
        fit: BoxFit.scaleDown,
        width: 15,
        height: 15,
        color: ColorName.white,
      ),
    );
  }
}
