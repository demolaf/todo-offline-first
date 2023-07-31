import 'package:todo_bloc/src/data/api/todo_api.dart';
import 'package:todo_bloc/src/data/models/todo/todo_dto.dart';
import 'package:todo_bloc/src/data/repositories/todo/todo_repository.dart';

enum SourceType {
  local,
  remote,
}

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
  Future<void> createTodo(
    SourceType sourceType, {
    required String id,
    required String color,
    required DateTime time,
    required String priority,
    required String description,
    required String title,
  }) async {
    await _todoApi.createTodo(
      sourceType,
      id: id,
      color: color,
      time: time,
      priority: priority,
      description: description,
      title: title,
    );
  }

  @override
  Stream<List<TodoDTO>> getAllTodos() {
    return _todoApi.getAllTodos();
  }

  @override
  Future<void> getTodo() {
    // TODO(demolaf): implement getTodo
    throw UnimplementedError();
  }
}
