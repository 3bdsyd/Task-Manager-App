import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';

import 'package:todo_app/src/home/model/todos_model.dart';


class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'task_manager.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(
      '''
      CREATE TABLE tasks (
        id INTEGER PRIMARY KEY,
        todo TEXT NOT NULL,
        completed INTEGER NOT NULL,
        userId INTEGER NOT NULL
      )
      ''',
    );
  }

  Future<int> insertTask(Todo todo) async {
    Database db = await database;
    return await db.insert('tasks', todo.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Todo>> getTasks() async {
    Database db = await database;
    List<Map<String, dynamic>> taskMaps = await db.query('tasks');
    return List.generate(taskMaps.length, (i) {
      return Todo.fromJson(taskMaps[i]);
    });
  }

  Future<int> updateTask(Todo todo) async {
    Database db = await database;
    return await db
        .update('tasks', todo.toJson(), where: 'id = ?', whereArgs: [todo.id]);
  }

  Future<int> deleteTask(int id) async {
    Database db = await database;
    return await db.delete('tasks', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> close() async {
    Database db = await database;
    await db.close();
  }
}
