import 'dart:developer' as developer;
import 'package:realm/realm.dart';
import 'package:todo_bloc/src/data/local_storage/local_storage.dart';
import 'package:todo_bloc/src/data/models/todo/todo_dto.dart';
import 'package:todo_bloc/src/data/repositories/todo/todo_repository_impl.dart';

class TodoApi {
  TodoApi({
    required LocalStorage localStorage,
  }) : _localStorage = localStorage;

  final LocalStorage _localStorage;

  /// We use this to ensure that we only create and update
  /// the one new object at a time
  String generateTodoId() {
    return ObjectId().hexString;
  }

  Future<void> createTodo(
    SourceType sourceType, {
    required String id,
    required String color,
    required DateTime time,
    required String priority,
    required String description,
    required String title,
  }) async {
    try {
      await _localStorage.create(
        TodoDTO(
          ObjectId.fromHexString(id),
          color,
          time.toIso8601String(),
          priority,
          description,
          title,
        ),
      );
    } catch (e) {
      developer.log(e.toString());
    }
  }

  Stream<List<TodoDTO>> getAllTodos() {
    try {
      return _localStorage
          .readAllAsStream<TodoDTO>()
          .asyncMap((event) => event.results.toList());
    } catch (e) {
      developer.log(e.toString());
      rethrow;
    }
  }
}
