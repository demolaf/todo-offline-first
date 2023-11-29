import 'package:apis/apis.dart';

abstract class TodoRepository {
  String getGeneratedTodoId();

  Future<void> upsertTodo({required Todo todo});

  Future<Todo?> getTodo(String id);

  void deleteTodo(String id);

  Stream<List<Todo>> getAllTodos();
}
