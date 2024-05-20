import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/src/home/presenters/home_provider.dart';
import 'package:todo_app/src/home/view/widgets/home_card.dart';
import 'package:todo_app/src/home/view/widgets/home_card_deleted_button.dart';
import 'package:todo_app/src/home/view/widgets/home_card_edit_button.dart';

class HomeCardTodoWidget extends StatelessWidget {
  final int index;
  const HomeCardTodoWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final int idTodo = Provider.of<HomeProviderImp>(context).todoItems[index].id;
    return Stack(
      children: [
        HomeCardWidget(index: index),
         Positioned(
          bottom: 0,
          right: 3,
          child: HomeCardEditButtonWidget(idTodo: idTodo),
        ),
         Positioned(
          bottom: 0,
          right: 35,
          child: HomeCardDeletedButton(
            idTodo: idTodo,
          ),
        ),
      ],
    );
  }
}
