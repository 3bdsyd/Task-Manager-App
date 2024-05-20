import 'package:flutter/material.dart';
import 'package:todo_app/core/gen/colors.gen.dart';
import 'package:todo_app/core/styles/text_styles.dart';

class LoginOrTextWidget extends StatelessWidget {
  const LoginOrTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(endIndent: 5),
        ),
        Text(
          "or",
          style: TextStyles.style14.copyWith(
            color: ColorName.deepBlue,
          ),
        ),
        const Expanded(
          child: Divider(indent: 5),
        ),
      ],
    );
  }
}
