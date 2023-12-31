
import 'package:apis/src/models/todo/dto/todo_dto.dart';

abstract class TodoApi {
  Future<TodoDTO?> getTodo(String id);

  Stream<List<TodoDTO>> getTodos();

  Future<void> createTodo(TodoDTO todo);

  Future<void> updateTodo(TodoDTO todo);

  Future<void> deleteTodo(String id);
}
