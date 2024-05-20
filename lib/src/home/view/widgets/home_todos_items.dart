import 'package:flutter/material.dart';
import 'package:todo_app/core/helper/status_view.dart';
import 'package:todo_app/shared/widgets/custom_shimmer.dart';
import 'package:todo_app/src/home/presenters/home_provider.dart';
import 'package:todo_app/src/home/view/widgets/home_card_todo.dart';
import 'package:provider/provider.dart';

class HomeTodosItemsWidget extends StatelessWidget {
  const HomeTodosItemsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bool loading = Provider.of<HomeProviderImp>(context).getTodosStView ==
        StatusViews.succuss;
    final int itemCount =
        Provider.of<HomeProviderImp>(context).todoItems.length;
    return SliverList.separated(
      itemCount: loading ? itemCount : 3,
      itemBuilder: (context, index) => loading
          ? HomeCardTodoWidget(index: index)
          : const CustomShimmerWidget(
              height: 100,
              width: 200,
            ),
      separatorBuilder: (BuildContext context, int index) =>
          const SizedBox(height: 10),
    );
  }
}
