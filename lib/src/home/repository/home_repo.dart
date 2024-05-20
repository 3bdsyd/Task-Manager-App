import 'package:todo_app/core/helper/failures_handling.dart';
import 'package:todo_app/core/network/crud.dart';
import 'package:todo_app/core/utils/constants/app_api.dart';
import 'package:todo_app/src/home/model/todos_model.dart';

abstract class HomeRepo {
  Future getTodos(int idUser);
  Future postTodo(String todo, bool completed, int userId);
  Future putTodo(int idTodo);
  Future deleteTodo(int idTodo);
}

class HomeRepoImp extends HomeRepo {
  @override
  Future getTodos(int idUser) async {
    try {
      final result = await Crud().get(url: '${AppApi.getTodos}$idUser');
      return result.fold(
        (failure) => failure,
        (todos) => TodosModel.fromJson(todos),
      );
    } catch (_) {
      return Failures(errMessage: 'An error occurred');
    }
  }

  @override
  Future postTodo(String todo, bool completed, int userId) async {
    try {
      final result = await Crud().post(url: AppApi.postTodo, body: {
        'todo': 'Use DummyJSON in the project',
        'completed': false,
        'userId': 5,
      });
      return result.fold(
        (failure) => failure,
        (login) => TodosModel.fromJson(login),
      );
    } catch (_) {
      return Failures(errMessage: 'An error occurred, try again');
    }
  }

  @override
  Future putTodo(int idTodo) async {
    try {
      final result = await Crud().put(url: '${AppApi.editTodo}$idTodo');
      return result.fold(
        (failure) => failure,
        (login) => TodosModel.fromJson(login),
      );
    } catch (_) {
      return Failures(errMessage: 'An error occurred, try again');
    }
  }

  @override
  Future deleteTodo(int idTodo) async {
    try {
      final result = await Crud().delete(url: AppApi.postTodo);
      return result.fold(
        (failure) => failure,
        (login) => TodosModel.fromJson(login),
      );
    } catch (_) {
      return Failures(errMessage: 'An error occurred, try again');
    }
  }
}
