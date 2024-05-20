import 'package:flutter/material.dart';
import 'package:todo_app/core/gen/colors.gen.dart';
import 'package:todo_app/core/styles/text_styles.dart';

class HomeTodoButtonAddWidget extends StatelessWidget {
  const HomeTodoButtonAddWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: ColorName.lightGrey,
        borderRadius: BorderRadius.circular(8),
      ),
      height: 30,
      child: Text(
        'Add',
        style: TextStyles.style12.copyWith(
          color: ColorName.black,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
