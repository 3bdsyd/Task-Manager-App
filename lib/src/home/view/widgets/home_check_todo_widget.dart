import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/gen/assets.gen.dart';
import 'package:todo_app/core/gen/colors.gen.dart';
import 'package:todo_app/core/styles/text_styles.dart';
import 'package:todo_app/src/home/presenters/home_provider.dart';

class HomeCheckTodoWidget extends StatelessWidget {
  const HomeCheckTodoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProviderImp>(context);
    return Row(
      children: [
        Text(
          'completed',
          style: TextStyles.style10.copyWith(
            fontWeight: FontWeight.w800,
            color: ColorName.white,
          ),
        ),
        const SizedBox(width: 5),
        GestureDetector(
          onTap: () => provider.toggledCheckAddTodo(),
          child: Container(
            height: 20,
            width: 20,
            margin: const EdgeInsets.symmetric(vertical: 5),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: ColorName.lightGrey,
            ),
            child:
                provider.addTodoIsCompleted ? Assets.icons.check.svg() : null,
          ),
        ),
      ],
    );
  }
}
