import 'package:flutter/material.dart';
import 'package:todo_app/core/styles/text_styles.dart';

class HomeTextFieldWidget extends StatelessWidget {
  const HomeTextFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        style: TextStyles.style14.copyWith(color: Colors.white),
        maxLines: 5,
        decoration: const InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
