import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/gen/assets.gen.dart';
import 'package:todo_app/core/gen/colors.gen.dart';
import 'package:todo_app/src/home/presenters/home_provider.dart';

class HomeCardDeletedButton extends StatelessWidget {
  final int idTodo;
  const HomeCardDeletedButton({super.key, required this.idTodo});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Provider.of<HomeProviderImp>(context).deleteTodos(idTodo),
      child: Container(
        width: 25,
        height: 25,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: Colors.redAccent,
          shape: BoxShape.circle,
        ),
        child: Assets.icons.delete.image(
          fit: BoxFit.scaleDown,
          width: 15,
          height: 15,
          color: ColorName.white,
        ),
      ),
    );
  }
}
