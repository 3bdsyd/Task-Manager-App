import 'package:flutter/material.dart';
import 'package:todo_app/src/home/view/widgets/home_card.dart';
import 'package:todo_app/src/home/view/widgets/home_card_deleted_button.dart';
import 'package:todo_app/src/home/view/widgets/home_card_edit_button.dart';

class HomeCardTodoWidget extends StatelessWidget {
  final int index;
  const HomeCardTodoWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        HomeCardWidget(index: index),
        const Positioned(
          bottom: 0,
          right: 3,
          child: HomeCardEditButtonWidget(),
        ),
        const Positioned(
          bottom: 0,
          right: 35,
          child: HomeCardDeletedButton(),
        ),
      ],
    );
  }
}
