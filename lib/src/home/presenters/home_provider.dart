import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:todo_app/core/helper/failures_handling.dart';
import 'package:todo_app/core/helper/shared_preferences.dart';
import 'package:todo_app/core/helper/status_view.dart';
import 'package:todo_app/core/utils/constants/app_key.dart';
import 'package:todo_app/src/home/model/todo_deleted_model.dart';
import 'package:todo_app/src/home/model/todos_model.dart';
import 'package:todo_app/src/home/repository/home_repo.dart';

abstract class HomeProvider extends ChangeNotifier {
  Future getTodos();
  Future deleteTodos(int idTodo);
}

class HomeProviderImp extends HomeProvider {
  StatusViews getTodosStView = StatusViews.initial;

  StatusViews editTodoStView = StatusViews.initial;

  GlobalKey<ScaffoldMessengerState> scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();

  final HomeRepoImp _homeRepoImp = HomeRepoImp();

  final String? userId = SharedPref.getString(AppKey.userId);

  TodosModel? todosModel;

  int activeIndex = 0;

  int skip = 0;
  int currentPage = 1;
  int limit = 5;

  List<Todo> todoItems = [];

  TodoDeletedModel? todoDeletedModel;

  void nextPage() {
    if (getTodosStView != StatusViews.succuss ||
        skip + limit >= todosModel!.total) {
      return;
    }
    skip = skip + limit;
    currentPage++;
    getTodos();
  }

  void previousPage() {
    if (getTodosStView != StatusViews.succuss || skip == 0) return;
    skip = skip - limit;

    currentPage--;
    getTodos();
  }

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
  Future<void> deleteTodos(int idTodo) async {
    // Set status to loading
    editTodoStView = StatusViews.loading;
    notifyListeners();

    final currentState = scaffoldKey.currentState;
    try {
      final result = await _homeRepoImp.deleteTodo(idTodo);

      if (result is Failures) {
        currentState!.showSnackBar(
          SnackBar(
            content: Text(result.errMessage),
          ),
        );
      } else if (result is TodoDeletedModel) {
        // If get todos is successful, update the todos model
        todoDeletedModel = result;

        editTodoStView = StatusViews.succuss;
        QuickAlert.show(
          context: scaffoldKey.currentContext!,
          type: QuickAlertType.success,
          barrierDismissible: true,
          confirmBtnText: 'Save',
          
        );

        selectTypeTodos(0);

        notifyListeners();
      }
    } catch (error) {
      if (currentState == null) return;
      currentState.showSnackBar(
        const SnackBar(
          content: Text('An error occurred'),
        ),
      );
    }
  }

  @override
  Future<void> getTodos() async {
    // Set status to loading
    getTodosStView = StatusViews.loading;
    notifyListeners();
    final currentState = scaffoldKey.currentState;
    try {
      final result = await _homeRepoImp.getTodos(userId!, limit, skip);

      if (result is Failures) {
        currentState!.showSnackBar(
          SnackBar(
            content: Text(result.errMessage),
          ),
        );
      } else if (result is TodosModel) {
        // If get todos is successful, update the todos model
        todosModel = result;

        getTodosStView = StatusViews.succuss;

        selectTypeTodos(0);

        notifyListeners();
      }
    } catch (error) {
      if (currentState == null) return;
      currentState.showSnackBar(
        const SnackBar(
          content: Text('An error occurred'),
        ),
      );
    }
  }
}
