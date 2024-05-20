import 'package:flutter/material.dart';
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
  Future editTodos(int idTodo, String todo, bool completed);
  Future addNewTodo();
}

class HomeProviderImp extends HomeProvider {
  StatusViews getTodosStView = StatusViews.initial;

  StatusViews editTodoStView = StatusViews.initial;
  StatusViews deleteTodoStView = StatusViews.initial;
  StatusViews addTodoStView = StatusViews.initial;

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

  void toggledCheckAddTodo() {
    addTodoIsCompleted = !addTodoIsCompleted;
    notifyListeners();
  }

  void toggledCheckEditTodo() {
    editTodoIsCompleted = !editTodoIsCompleted;
    notifyListeners();
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

  final TextEditingController addTodoController = TextEditingController();
  bool addTodoIsCompleted = false;

  @override
  Future<void> addNewTodo() async {
    if (addTodoController.text.isEmpty) return;

    // Set status to loading
    addTodoStView = StatusViews.loading;
    notifyListeners();
    final currentState = scaffoldKey.currentState;

    final result = await _homeRepoImp.postTodo(
      addTodoController.text.trim(),
      addTodoIsCompleted,
      userId!,
    );

    if (result is Failures) {
      currentState!.showSnackBar(
        SnackBar(
          content: Text(result.errMessage),
        ),
      );
    } else if (result is Todo) {
      addTodoStView = StatusViews.succuss;
      addTodoController.clear();
      addTodoIsCompleted = false;
      getTodos();
    }

    addTodoStView = StatusViews.initial;
    notifyListeners();
    try {} catch (error) {
      if (currentState == null) return;
      currentState.showSnackBar(
        const SnackBar(
          content: Text('An error occurred'),
        ),
      );
    }
  }

  final TextEditingController editTodoController = TextEditingController();
  bool editTodoIsCompleted = false;

  @override
  Future<void> editTodos(int idTodo, String todo, bool completed) async {
    // Set status to loading
    editTodoStView = StatusViews.loading;
    notifyListeners();
    final currentState = scaffoldKey.currentState;
    try {
      final result = await _homeRepoImp.putTodo(
        idTodo,
        editTodoController.text.trim(),
        editTodoIsCompleted,
      );

      if (result is Failures) {
        currentState!.showSnackBar(
          SnackBar(
            content: Text(result.errMessage),
          ),
        );
      } else if (result is TodoDeletedModel) {
        // If get todos is successful, update the todos model
        editTodoStView = StatusViews.succuss;
        getTodos();

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
  Future<void> deleteTodos(int idTodo) async {
    // Set status to loading
    deleteTodoStView = StatusViews.loading;
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
        deleteTodoStView = StatusViews.succuss;
        getTodos();
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

        selectTypeTodos(activeIndex);

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
