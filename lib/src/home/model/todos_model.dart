import 'dart:convert';

TodosModel todosModelFromJson(String str) =>
    TodosModel.fromJson(json.decode(str));

String todosModelToJson(TodosModel data) => json.encode(data.toJson());

class TodosModel {
  final List<Todo> todos;
  final int total;
  final int skip;
  final int limit;

  TodosModel({
    required this.todos,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory TodosModel.fromJson(Map<String, dynamic> json) => TodosModel(
        todos: List<Todo>.from(json["todos"].map((x) => Todo.fromJson(x))),
        total: json["total"],
        skip: json["skip"],
        limit: json["limit"],
      );

  Map<String, dynamic> toJson() => {
        "todos": List<dynamic>.from(todos.map((x) => x.toJson())),
        "total": total,
        "skip": skip,
        "limit": limit,
      };
}

Todo todoFromJson(String str) => Todo.fromJson(json.decode(str));

String todoToJson(Todo data) => json.encode(data.toJson());

class Todo {
  final int id;
  final String todo;
  final bool completed;
  final int userId;

  Todo({
    required this.id,
    required this.todo,
    required this.completed,
    required this.userId,
  });

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
        id: json["id"],
        todo: json["todo"],
        completed: json["completed"],
        userId: json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "todo": todo,
        "completed": completed,
        "userId": userId,
      };
}
