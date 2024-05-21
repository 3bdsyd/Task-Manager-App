import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/gen/assets.gen.dart';
import 'package:todo_app/core/gen/colors.gen.dart';
import 'package:todo_app/src/home/presenters/home_provider.dart';

class HomeCardEditButtonWidget extends StatelessWidget {
  final int index;
  const HomeCardEditButtonWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeProviderImp>(context);
    return InkWell(
      onTap: () =>
          Provider.of<HomeProviderImp>(context, listen: false).editTodo(
        provider.todoItems[index].id,
      ),
      child: Container(
        width: 30,
        height: 30,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: ColorName.deepBlue,
          shape: BoxShape.circle,
        ),
        child: Assets.icons.edit.svg(
          fit: BoxFit.scaleDown,
          width: 15,
          height: 15,
          colorFilter: const ColorFilter.mode(
            ColorName.white,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
