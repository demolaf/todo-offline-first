import 'dart:async';
import 'dart:developer' as developer;

import 'package:apis/src/apis/local_storage/local_storage.dart';
import 'package:apis/src/apis/todo/todo_api.dart';
import 'package:apis/src/models/todo/dto/todo_dto.dart';
import 'package:realm/realm.dart';

class LocalTodoApi extends TodoApi {
  LocalTodoApi({
    required LocalStorage localStorage,
  }) : _localStorage = localStorage;

  final LocalStorage _localStorage;

  @override
  Future<TodoDTO?> getTodo(String id) async {
    return _localStorage
        .read<TodoDTO>(r'id == $0', [ObjectId.fromHexString(id)]).firstOrNull;
  }

  /// Create a todo_object and store in local
  // TODO(demolaf): update this to upsertTodo instead
  @override
  Future<void> createTodo(TodoDTO todo) async {
    try {
      await _localStorage.create(todo);
    } catch (e) {
      developer.log(e.toString());
    }
  }

  @override
  Future<void> updateTodo(TodoDTO todo) async {
    try {
      await _localStorage.create(todo);
    } catch (e) {
      developer.log(e.toString());
    }
  }

  Future<void> updateTodoProperty(void Function() callback) {
    return _localStorage.update<TodoDTO>(callback);
  }

  @override
  Future<void> deleteTodo(String id) async {
    final todo = await getTodo(id);

    if (todo != null) {
      await _localStorage.delete<TodoDTO>(todo);
    }
  }

  /// Fetch todos from local db
  @override
  Stream<List<TodoDTO>> getTodos() => _localStorage
      .readAllAsStream<TodoDTO>()
      .asyncMap((event) => event.results.toList());
}
