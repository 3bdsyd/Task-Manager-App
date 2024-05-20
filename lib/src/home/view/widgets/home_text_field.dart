import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/gen/colors.gen.dart';
import 'package:todo_app/core/styles/text_styles.dart';
import 'package:todo_app/src/home/presenters/home_provider.dart';

class HomeTextFieldWidget extends StatelessWidget {
  const HomeTextFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        controller: Provider.of<HomeProviderImp>(context).addTodoController,
        style: TextStyles.style14.copyWith(color: Colors.white),
        maxLines: 5,
        cursorColor: ColorName.black,
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
