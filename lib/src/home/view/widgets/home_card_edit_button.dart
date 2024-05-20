import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/gen/assets.gen.dart';
import 'package:todo_app/core/gen/colors.gen.dart';
import 'package:todo_app/src/home/presenters/home_provider.dart';

class HomeCardEditButtonWidget extends StatelessWidget {
  final int idTodo;
  const HomeCardEditButtonWidget({super.key, required this.idTodo});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Provider.of<HomeProviderImp>(context, listen: false)
          .deleteTodos(idTodo),
      child: Container(
        width: 25,
        height: 25,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: ColorName.deepBlue,
          shape: BoxShape.circle,
        ),
        child: Assets.icons.edit.svg(
          fit: BoxFit.scaleDown,
          width: 10,
          height: 10,
          colorFilter: const ColorFilter.mode(
            ColorName.white,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
