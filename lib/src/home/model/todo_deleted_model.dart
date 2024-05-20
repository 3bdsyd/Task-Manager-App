import 'dart:convert';

TodoDeletedModel todoDeletedModelFromJson(String str) =>
    TodoDeletedModel.fromJson(json.decode(str));

String todoDeletedModelToJson(TodoDeletedModel data) =>
    json.encode(data.toJson());

class TodoDeletedModel {
  final int id;
  final String todo;
  final bool completed;
  final int userId;
  final bool isDeleted;
  final DateTime deletedOn;

  TodoDeletedModel({
    required this.id,
    required this.todo,
    required this.completed,
    required this.userId,
    required this.isDeleted,
    required this.deletedOn,
  });

  factory TodoDeletedModel.fromJson(Map<String, dynamic> json) =>
      TodoDeletedModel(
        id: json["id"],
        todo: json["todo"],
        completed: json["completed"],
        userId: json["userId"],
        isDeleted: json["isDeleted"],
        deletedOn: DateTime.parse(json["deletedOn"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "todo": todo,
        "completed": completed,
        "userId": userId,
        "isDeleted": isDeleted,
        "deletedOn": deletedOn.toIso8601String(),
      };
}
