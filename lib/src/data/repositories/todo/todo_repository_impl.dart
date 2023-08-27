// import 'dart:developer' as developer;

import 'package:realm/realm.dart';
import 'package:todo_bloc/src/data/api/todo/todo_api.dart';
import 'package:todo_bloc/src/data/models/domains/todo.dart';
import 'package:todo_bloc/src/data/models/dtos/todo/todo_dto.dart';
import 'package:todo_bloc/src/data/repositories/todo/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  TodoRepositoryImpl({
    required TodoApi todoApi,
  }) : _todoApi = todoApi;

  final TodoApi _todoApi;

  /// We use this to ensure that we only create and update
  /// the one new object at a time from the create_todo user interface
  @override
  String getGeneratedTodoId() {
    return ObjectId().hexString;
  }

  @override
  Future<void> createTodo({required Todo todo}) async {
    await _todoApi.createTodo(
      TodoDTO(
        ObjectId.fromHexString(todo.id),
        todo.color!,
        todo.time!,
        todo.priority!,
        todo.description,
        todo.title,
        false,
        false,
      ),
    );
  }

  @override
  Stream<List<Todo>> getAllTodos() => _todoApi
      .getTodos()
      .map((event) => event.map((e) => e.toPlainObject()).toList());

  @override
  Future<Todo?> getTodo(String id) async {
    return _todoApi.getTodo(id).then((value) => value?.toPlainObject());
  }

  @override
  void deleteTodo(String id) {
    _todoApi.deleteTodo(id);
  }
}
