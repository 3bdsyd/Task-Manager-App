import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:todo_app/core/helper/database.dart';
import 'package:todo_app/core/helper/failures_handling.dart';
import 'package:todo_app/core/helper/shared_preferences.dart';
import 'package:todo_app/core/helper/status_view.dart';
import 'package:todo_app/core/router/app_router.gr.dart';
import 'package:todo_app/core/utils/constants/app_key.dart';
import 'package:todo_app/shared/widgets/custom_dialog.dart';
import 'package:todo_app/shared/widgets/custom_snackbar.dart';
import 'package:todo_app/src/home/model/todo_deleted_model.dart';
import 'package:todo_app/src/home/model/todos_model.dart';
import 'package:todo_app/src/home/repository/home_repo.dart';

abstract class HomeProvider extends ChangeNotifier {
  //* get tasks from the server if internet is available.
  Future getTodosFromServer();

  //* get tasks from the data base if the Internet is not available.
  Future getTodosFromLocal();

  //* Determine the method through which tasks will be fetched.
  Future getTodos();

  //* Delete a task from the server
  Future deleteTodo(int idTodo);

  //* Add a New task in the server
  Future addNewTodo();

  //* Edit a task in the server
  Future editTodo(int idTodo);

  //* logOut from current user
  Future logOut();
}

class HomeProviderImp extends HomeProvider {
  //! ----------------- Variables -----------------
  RefreshController refreshController = RefreshController();

  final GlobalKey<ScaffoldMessengerState> scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();

  final TextEditingController addTodoController = TextEditingController();

  final String? userId = SharedPref.getString(AppKey.userId);

  final DatabaseHelper _database = DatabaseHelper();

  final HomeRepoImp _homeRepoImp = HomeRepoImp();

  StatusViews getTodosStView = StatusViews.initial;

  List<Todo> todoItems = [];
  List<Todo> _todoLocalItems = [];
  List<Todo> _todoServerItems = [];

  TodosModel? todosModel;

  bool addTodoIsCompleted = false;

  int currentPage = 1;

  int activeType = 0;

  int limit = 5;

  int skip = 0;

  //! ----------------- Functions -----------------

  //* Fetch todos from the local database
  @override
  Future<void> getTodosFromLocal() async {
    todoItems = _todoLocalItems = await _database.getTasks();
  }

  //* Fetch todos from the server
  @override
  Future<void> getTodosFromServer() async {
    final result = await _homeRepoImp.getTodos(userId!, limit, skip);

    if (result is TodosModel) {
      todosModel = result;

      todoItems = _todoServerItems = result.todos;

      for (Todo todo in _todoServerItems) {
        //! Check if the todo item is not present in the local database
        if (!_todoLocalItems.any((element) => element.id == todo.id)) {
          await _database.insertTask(todo);
        }
      }
      refreshController.refreshCompleted();
      getTodosStView = StatusViews.succuss;
    } else if (result is Failures) {
      if (_todoLocalItems.isNotEmpty) {
        getTodosStView = StatusViews.initial;
      }

      currentPage = 1;
      skip = 0;

      refreshController.refreshFailed();
      scaffoldKey.currentState
          ?.showSnackBar(SnackBar(content: Text(result.errMessage)));
    }

    notifyListeners();
  }

  //* Fetch todos from both local and server
  @override
  Future<void> getTodos() async {
    if (getTodosStView == StatusViews.loading) return;

    //! initial type (ALL TASKS) => 0
    selectTypeTodos(0);

    await getTodosFromLocal();

    getTodosStView = StatusViews.loading;
    notifyListeners();

    await getTodosFromServer();
  }

  //* Delete a todo by id
  @override
  Future<void> deleteTodo(int idTodo) async {
    customShowDialog(scaffoldKey.currentContext!);

    final result = await _homeRepoImp.deleteTodo(idTodo);

    scaffoldKey.currentContext!.router.popForced();

    if (result is Failures) {
      scaffoldKey.currentState?.showSnackBar(snackBar(result.errMessage));
    } else if (result is TodoDeletedModel) {
      scaffoldKey.currentState
          ?.showSnackBar(snackBar('The task was deleted successfully'));

      await getTodos();
    }
  }

  //* Toggle the task status value
  void toggledCheckAddTodo() {
    addTodoIsCompleted = !addTodoIsCompleted;
    notifyListeners();
  }

  //* Add a new todo
  @override
  Future<void> addNewTodo() async {
    if (addTodoController.text.isEmpty) return;

    customShowDialog(scaffoldKey.currentContext!);

    final result = await _homeRepoImp.postTodo(
      addTodoController.text.trim(),
      addTodoIsCompleted,
      userId!,
    );

    scaffoldKey.currentContext!.router.popForced();

    if (result is Failures) {
      scaffoldKey.currentState?.showSnackBar(snackBar(result.errMessage));
    } else if (result is Todo) {
      scaffoldKey.currentState
          ?.showSnackBar(snackBar('A new task has been inserted successfully'));

      addTodoController.clear();
      addTodoIsCompleted = false;

      await getTodos();
    }
  }

  //* edit task status
  void toggledCheckEditTodo(int index) {
    todoItems[index] = Todo(
      id: todoItems[index].id,
      todo: todoItems[index].todo,
      completed: todoItems[index].completed == 0 ? 1 : 0,
      userId: todoItems[index].userId,
    );
    notifyListeners();
  }

  //* edit todo text
  void changeTextEditTodo(int index, String todo) {
    todoItems[index] = Todo(
      id: todoItems[index].id,
      todo: todo,
      completed: todoItems[index].completed,
      userId: todoItems[index].userId,
    );
  }

  //* EDIT a todo by id
  @override
  Future<void> editTodo(int idTodo) async {
    customShowDialog(scaffoldKey.currentContext!);
    final String todo = todoItems.firstWhere((todo) => todo.id == idTodo).todo;

    final bool completed =
        todoItems.firstWhere((todo) => todo.id == idTodo).completed == 0
            ? false
            : true;

    final result = await _homeRepoImp.putTodo(
      idTodo,
      todo,
      completed,
    );

    scaffoldKey.currentContext!.router.popForced();

    if (result is Failures) {
      scaffoldKey.currentState?.showSnackBar(snackBar(result.errMessage));
    } else if (result is Todo) {
      scaffoldKey.currentState
          ?.showSnackBar(snackBar('The task was edited successfully'));

      await getTodos();
    }
  }

  //* Go to the next page
  void nextPage() async {
    if (StatusViews.succuss == getTodosStView &&
        skip + limit < todosModel!.total) {
      skip = skip + limit;
      currentPage++;
      await getTodos();
    }
  }

  //* Return to previous page
  void previousPage() async {
    if (getTodosStView != StatusViews.succuss || skip == 0) return;
    skip = skip - limit;
    currentPage--;
    await getTodos();
  }

  //* Determine the type of todo
  void selectTypeTodos(int activeIndex) {
    activeType = activeIndex;
    if (activeType == 0) {
      todoItems = getTodosStView == StatusViews.succuss
          ? _todoServerItems
          : _todoLocalItems;
    } else if (activeType == 1) {
      todoItems = getTodosStView == StatusViews.succuss
          ? _todoServerItems.where((todo) => todo.completed == 0).toList()
          : _todoLocalItems.where((todo) => todo.completed == 0).toList();
    } else if (activeType == 2) {
      todoItems = getTodosStView == StatusViews.succuss
          ? _todoServerItems.where((todo) => todo.completed == 1).toList()
          : _todoLocalItems.where((todo) => todo.completed == 1).toList();
    }
    notifyListeners();
  }

  //* Log out of the application for a default state
  @override
  Future logOut() async {
    await SharedPref.remove(AppKey.userId);

    scaffoldKey.currentContext!.router.replace(const LoginView());
  }
}
