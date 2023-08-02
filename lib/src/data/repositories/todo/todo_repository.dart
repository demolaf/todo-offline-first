import 'package:todo_bloc/src/data/models/todo/todo_dto.dart';
import 'package:todo_bloc/src/data/repositories/todo/todo_repository_impl.dart';

abstract class TodoRepository {
  String getGeneratedTodoId();

  Future<void> createTodo({
    required String id,
    required String color,
    required DateTime time,
    required String priority,
    required String description,
    required String title,
  });

  Future<void> getTodo();

  Stream<List<TodoDTO>> getAllTodos(SourceType sourceType);

  Future<void> syncTodosWithRemote();

  bool checkIfNeedToSync();
}
