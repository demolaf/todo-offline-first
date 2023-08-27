import 'package:todo_bloc/src/data/models/domains/todo.dart';

abstract class TodoRepository {
  String getGeneratedTodoId();

  Future<void> createTodo({required Todo todo});

  Future<Todo?> getTodo(String id);

  void deleteTodo(String id);

  Stream<List<Todo>> getAllTodos();
}
