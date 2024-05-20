import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/gen/assets.gen.dart';
import 'package:todo_app/core/gen/colors.gen.dart';
import 'package:todo_app/core/styles/text_styles.dart';
import 'package:todo_app/src/home/model/todos_model.dart';
import 'package:todo_app/src/home/presenters/home_provider.dart';

class HomeCardWidget extends StatelessWidget {
  final int index;
  const HomeCardWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final Todo todo = Provider.of<HomeProviderImp>(context).todoItems[index];
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: ColorName.lightGrey,
      surfaceTintColor: ColorName.lightGrey,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'TODO',
                  style: TextStyles.style14.copyWith(
                    fontWeight: FontWeight.w600,
                    color: ColorName.darkGrey,
                  ),
                ),
                Assets.icons.report.svg(fit: BoxFit.scaleDown, width: 15),
              ],
            ),
            const SizedBox(height: 5),
            Text(
              todo.todo,
              style: TextStyles.style14,
            ),
            const SizedBox(height: 5),
            Container(
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.all(3),
              height: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: todo.completed
                    ? ColorName.water
                    : ColorName.purplePlum.withOpacity(.7),
              ),
              child: Text(
                textAlign: TextAlign.start,
                todo.completed ? 'Done' : 'In Progress',
                style: TextStyles.style10.copyWith(color: ColorName.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
