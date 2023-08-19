import 'package:todo_bloc/src/data/models/domains/todo.dart';

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

  Future<Todo?> getTodo(String id);

  void deleteTodo(String id);

  Stream<List<Todo>> getAllTodos();
}
