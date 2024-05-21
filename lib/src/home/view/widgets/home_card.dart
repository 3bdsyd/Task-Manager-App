import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
    final HomeProviderImp provider = Provider.of<HomeProviderImp>(context);
    final Todo todo = provider.todoItems[index];
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
            TextFormField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              controller: TextEditingController(text: todo.todo),
              onChanged: (value) => provider.changeTextEditTodo(index, value),
              style: TextStyles.style14,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.zero,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 5),
            GestureDetector(
              onTap: () => provider.toggledCheckEditTodo(index),
              child: Container(
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.all(3),
                height: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: todo.completed == 1 || todo.completed == true
                      ? ColorName.water
                      : ColorName.purplePlum.withOpacity(.7),
                ),
                child: Text(
                  textAlign: TextAlign.start,
                  todo.completed == 1 || todo.completed == true
                      ? 'Done'
                      : 'In Progress',
                  style: TextStyles.style10.copyWith(color: ColorName.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
