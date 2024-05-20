import 'package:flutter/material.dart';
import 'package:todo_app/core/helper/failures_handling.dart';
import 'package:todo_app/core/helper/status_view.dart';
import 'package:todo_app/src/home/model/todos_model.dart';
import 'package:todo_app/src/home/repository/home_repo.dart';

abstract class HomeProvider extends ChangeNotifier {
  Future getTodos();
}

class HomeProviderImp extends HomeProvider {
  StatusViews statusViews = StatusViews.initial; // Initial status view
  GlobalKey<ScaffoldMessengerState> scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();
  final HomeRepoImp _homeRepoImp = HomeRepoImp();
  TodosModel? todosModel;
  int activeIndex = 0;
  List<Todo> todoItems = [];

  void selectTypeTodos(int activeIndex) {
    this.activeIndex = activeIndex;
    if (activeIndex == 0) {
      todoItems = todosModel?.todos ?? [];
    } else if (activeIndex == 1) {
      todoItems =
          todosModel?.todos.where((todo) => todo.completed == false).toList() ??
              [];
    } else if (activeIndex == 2) {
      todoItems =
          todosModel?.todos.where((todo) => todo.completed == true).toList() ??
              [];
    }
    notifyListeners();
  }

  @override
  Future<void> getTodos() async {
    // Set status to loading
    statusViews = StatusViews.loading;
    notifyListeners();

    try {
      final result = await _homeRepoImp.getTodos(1);
      print(result);

      if (result is Failures) {
        scaffoldKey.currentState!.showSnackBar(
          SnackBar(
            content: Text(result.errMessage),
          ),
        );
      } else if (result is TodosModel) {
        // If get todos is successful, update the todos model
        todosModel = result;

        statusViews = StatusViews.succuss;

        selectTypeTodos(0);
        
        notifyListeners();
      }
    } catch (error) {
      final context = scaffoldKey.currentContext;
      if (context != null) {
        scaffoldKey.currentState!.showSnackBar(
          const SnackBar(
            content: Text('An error occurred'),
          ),
        );
      }
    }
  }
}
