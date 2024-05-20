import 'package:flutter/material.dart';
import 'package:todo_app/core/gen/assets.gen.dart';
import 'package:todo_app/core/gen/colors.gen.dart';
import 'package:todo_app/core/styles/text_styles.dart';

class CustomButtonWidget extends StatelessWidget {
  final String title;
  final Function() onTap;
  final Widget? suffixIcon;
  const CustomButtonWidget({
    super.key,
    required this.title,
    required this.onTap,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          foregroundColor: const MaterialStatePropertyAll(
            ColorName.white,
          ),
          backgroundColor: const MaterialStatePropertyAll(
            ColorName.purplePlum,
          ),
        ),
        child: ListTile(
          title: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyles.styleBold16.copyWith(
              color: ColorName.white,
            ),
          ),
          trailing: suffixIcon ??
              Assets.icons.arrowLongRight.svg(
                colorFilter: const ColorFilter.mode(
                  ColorName.white,
                  BlendMode.srcIn,
                ),
              ),
        ),
      ),
    );
  }
}
