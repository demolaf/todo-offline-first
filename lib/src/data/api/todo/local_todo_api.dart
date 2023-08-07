import 'dart:async';
import 'dart:developer' as developer;
import 'package:realm/realm.dart';
import 'package:todo_bloc/src/data/api/todo/todo_api.dart';
import 'package:todo_bloc/src/data/local_storage/local_storage.dart';
import 'package:todo_bloc/src/data/models/dtos/todo/todo_dto.dart';

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
  @override
  Future<void> createTodo(TodoDTO todo) async {
    try {
      final newTodo = TodoDTO(
        todo.id,
        todo.color,
        todo.time,
        todo.priority,
        todo.description,
        todo.title,
        todo.synced,
        todo.completed,
      );
      await _localStorage.create(newTodo);
    } catch (e) {
      developer.log(e.toString());
    }
  }

  @override
  Future<void> updateTodo(TodoDTO todo) {
    // TODO(demolaf): implement updateTodo
    throw UnimplementedError();
  }

  @override
  Future<void> deleteTodo(String id) async {
    final todo = await getTodo(id);

    if (todo != null) {
      await _localStorage.delete(todo);
    }
  }

  /// Fetch todos from local db
  @override
  Stream<List<TodoDTO>> getTodos() => _localStorage
      .readAllAsStream<TodoDTO>()
      .asyncMap((event) => event.results.toList());
}
