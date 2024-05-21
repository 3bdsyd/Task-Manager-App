import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_app/core/helper/failures_handling.dart';
import 'package:todo_app/core/network/crud.dart';
import 'package:todo_app/core/utils/constants/app_api.dart';
import 'package:todo_app/src/home/model/todo_deleted_model.dart';
import 'package:todo_app/src/home/model/todos_model.dart';
import 'package:todo_app/src/home/repository/home_repo.dart';
import 'package:todo_app/src/login/model/login_model.dart';
import 'package:todo_app/src/login/repository/login_repo.dart';

import 'mock_crud.mocks.dart';

@GenerateMocks([Dio, Crud])
void main() {
  late MockCrud mockCrud;
  late LoginRepoImp loginRepo;
  late HomeRepoImp homeRepo;

  setUp(() {
    mockCrud = MockCrud();
    loginRepo = LoginRepoImp();
    homeRepo = HomeRepoImp();
  });

  group('LoginRepo', () {
    const String testUrl = AppApi.login;
    const String username = 'kminchelle';
    const String password = '0lelplR';
    final Map<String, dynamic> loginResponse = {
      "id": 15,
      "username": "kminchelle",
      "email": "kminchelle@qq.com",
      "firstName": "Jeanne",
      "lastName": "Halvorson",
      "gender": "female",
      "image": "https://robohash.org/Jeanne.png?set=set4",
      "token":
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTUsInVzZXJuYW1lIjoia21pbmNoZWxsZSIsImVtYWlsIjoia21pbmNoZWxsZUBxcS5jb20iLCJmaXJzdE5hbWUiOiJKZWFubmUiLCJsYXN0TmFtZSI6IkhhbHZvcnNvbiIsImdlbmRlciI6ImZlbWFsZSIsImltYWdlIjoiaHR0cHM6Ly9yb2JvaGFzaC5vcmcvSmVhbm5lLnBuZz9zZXQ9c2V0NCIsImlhdCI6MTcxMTIwOTAwMSwiZXhwIjoxNzExMjEyNjAxfQ.F_ZCpi2qdv97grmWiT3h7HcT1prRJasQXjUR4Nk1yo8"
    };

    test('postLogin returns LoginModel on success', () async {
      when(mockCrud.post(
              url: testUrl, body: {'username': username, 'password': password}))
          .thenAnswer((_) async => right(loginResponse));

      final result = await loginRepo.postLogin(username, password);

      expect(result, isA<LoginModel>());
      final loginModel = result as LoginModel;
      expect(loginModel.username, equals('kminchelle'));
      expect(loginModel.email, equals('kminchelle@qq.com'));
    });

    test('postLogin returns Failures on error', () async {
      when(mockCrud.post(
              url: testUrl,
              body: {'username': 'testNotFoundUserName', 'password': password}))
          .thenAnswer((_) async => left(Failures(errMessage: 'Error')));

      final result =
          await loginRepo.postLogin('testNotFoundUserName', password);

      expect(result, isA<Failures>());
      final failure = result as Failures;
      expect(failure.errMessage, equals('Invalid credentials'));
    });
  });

  group('HomeGetTodosRepo', () {
    const String todosUrl = '${AppApi.getTodos}/5';
    const String userId = '5';

    final Map<String, dynamic> todosResponse = {
      "todos": [
        {
          "id": 19,
          "todo": "Create a compost pile",
          "completed": true,
          "userId": 5
        },
      ],
      "total": 1,
      "skip": 0,
      "limit": 1
    };

    test('get todos returns TodosModel on success', () async {
      when(mockCrud.get(url: todosUrl))
          .thenAnswer((_) async => right(todosResponse));

      final result = await homeRepo.getTodos(userId, 1, 0);

      expect(result, isA<TodosModel>());
    });

    test('get todos returns Failures on error', () async {
      when(mockCrud.get(url: todosUrl))
          .thenAnswer((_) async => right(todosResponse));

      final result = await homeRepo.getTodos('userIdNotFound', 1, 0);

      expect(result, isA<Failures>());
    });
  });

  group('HomePostRepo', () {
    const String postTodoUrl = AppApi.postTodo;
    const String todoText = 'Test todo';
    const bool completed = false;
    const String userId = '5';

    final Map<String, dynamic> todoResponse = {
      "id": 151,
      "todo": "Use DummyJSON in the project",
      "completed": false,
      "userId": userId,
    };

    test('put Todo returns Todo on success', () async {
      when(mockCrud.put(
        url: postTodoUrl,
        body: {
          'todo': todoText,
          'completed': completed,
          'userId': userId,
        },
      )).thenAnswer((_) async => right(todoResponse));

      final result = await homeRepo.postTodo(
        todoText,
        completed,
        userId.toString(),
      );

      expect(result, isA<Todo>());
    });

    test('post Todo returns Failures on error', () async {
      when(mockCrud.post(
        url: postTodoUrl,
        body: {
          'todo': todoText,
          'completed': completed,
          'userId': 'userIdNotFound'
        },
      )).thenAnswer(
          (_) async => left(Failures(errMessage: 'An error occurred')));

      final result = await homeRepo.postTodo(
        todoText,
        completed,
        'userIdNotFound',
      );

      expect(result, isA<Failures>());
    });
  });

  group('HomePutRepo', () {
    const String putTodoUrl = AppApi.editTodo;
    const String todoText = 'Test todo';
    const bool completed = false;
    const int id = 5;

    final Map<String, dynamic> todoResponse = {
      "id": 5,
      "todo": "Solve a Rubik's cube",
      "completed": false,
      "userId": 31
    };

    test('put Todo returns Todo on success', () async {
      when(mockCrud.put(
        url: putTodoUrl,
        body: {'todo': todoText, 'completed': completed},
      )).thenAnswer((_) async => right(todoResponse));

      final result = await homeRepo.putTodo(
        id,
        todoText,
        completed,
      );

      expect(result, isA<Todo>());
    });

    test('put Todo returns Failures on error', () async {
      when(mockCrud.post(
        url: putTodoUrl,
        body: {
          'todo': todoText,
          'completed': completed,
          'userId': 'userIdNotFound'
        },
      )).thenAnswer(
          (_) async => left(Failures(errMessage: 'An error occurred')));

      final result = await homeRepo.putTodo(
        -1,
        todoText,
        completed,
      );
      expect(result, isA<Failures>());
    });
  });

  group('HomeDeleteRepo', () {
    const String deleteTodoUrl = AppApi.editTodo;

    test('deleteTodo returns TodoDeletedModel on success', () async {
      final Map<String, dynamic> deleteResponse = {
        "id": 1,
        "todo": "Do something nice for someone I care about",
        "completed": true,
        "userId": 26,
        "isDeleted": true,
        "deletedOn": ''
      };
      when(mockCrud.delete(url: deleteTodoUrl)).thenAnswer(
        (_) async => right(deleteResponse),
      );

      final result = await homeRepo.deleteTodo(
        1, 
      );

      expect(result, isA<TodoDeletedModel>());
     
    });

    test('deleteTodo returns Failures on error', () async {
      when(mockCrud.delete(url: deleteTodoUrl)).thenAnswer(
        (_) async => left(Failures(errMessage: 'An error occurred')),
      );

      final result = await homeRepo.deleteTodo(
        -1,
      );

      expect(result, isA<Failures>());
  
    });
  });
}
