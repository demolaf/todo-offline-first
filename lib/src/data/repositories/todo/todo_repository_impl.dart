// import 'dart:developer' as developer;

import 'package:realm/realm.dart';
import 'package:todo_bloc/src/data/api/todo_api.dart';
import 'package:todo_bloc/src/data/models/domains/todo.dart';
import 'package:todo_bloc/src/data/models/dtos/todo/todo_dto.dart';
import 'package:todo_bloc/src/data/repositories/todo/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  TodoRepositoryImpl({
    required TodoApi todoApi,
  }) : _todoApi = todoApi;

  final TodoApi _todoApi;
  @override
  String getGeneratedTodoId() {
    return _todoApi.generateTodoId();
  }

  @override
  bool checkEmptyTodosInLocal() {
    return _todoApi.checkEmptyTodosInLocal();
  }

  @override
  Future<void> createTodo({
    required String id,
    required String color,
    required DateTime time,
    required String priority,
    required String description,
    required String title,
  }) async {
    await _todoApi.createTodo(
      id: id,
      color: color,
      time: time,
      priority: priority,
      description: description,
      title: title,
    );
  }

  @override
  Stream<RealmResultsChanges> listenForLocalChanges() {
    return _todoApi.listenForChangesInLocal();
  }

  @override
  Stream<List<Todo>> getAllTodos() => _todoApi
      .fetchAllTodos()
      .map((event) => event.map((e) => e.toPlainObject()).toList());

  @override
  Todo getTodo(ObjectId id) {
    return _todoApi.getTodo(id).toPlainObject();
  }

  @override
  void deleteTodo(ObjectId id) {
    _todoApi.deleteTodo(id);
  }
}
