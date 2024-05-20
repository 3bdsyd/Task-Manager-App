import 'package:draggable_expandable_fab/draggable_expandable_fab.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/core/gen/assets.gen.dart';
import 'package:todo_app/core/gen/colors.gen.dart';
import 'package:todo_app/core/styles/text_styles.dart';
import 'package:todo_app/src/home/view/widgets/home_check_todo_widget.dart';
import 'package:todo_app/src/home/view/widgets/home_text_field.dart';
import 'package:todo_app/src/home/view/widgets/home_todo_button_add.dart';

class HomeFloatingActionButtonWidget extends StatelessWidget {
  const HomeFloatingActionButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ExpandableDraggableFab(
      openWidget: CircleAvatar(
        radius: 25,
        backgroundColor: ColorName.purplePlum,
        child: Assets.icons.add.image(width: 25, color: ColorName.white),
      ),
      childrenAlignment: Alignment.centerLeft,
      childrenBacgroundColor: ColorName.purplePlum.withOpacity(.8),
      childrenCount: 1,
      distance: 50,
      closeChildrenRotate: true,
      children: [
        SizedBox(
          height: 200,
          width: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'New TODO',
                style: TextStyles.style12.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const HomeTextFieldWidget(),
              const HomeCheckTodoWidget(),
              const HomeTodoButtonAddWidget()
            ],
          ),
        ),
      ],
    );
  }
}
