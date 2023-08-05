import 'package:realm/realm.dart';
import 'package:todo_bloc/src/data/models/domains/todo.dart';

abstract class TodoRepository {
  String getGeneratedTodoId();

  bool checkEmptyTodosInLocal();

  Future<void> createTodo({
    required String id,
    required String color,
    required DateTime time,
    required String priority,
    required String description,
    required String title,
  });

  Todo getTodo(ObjectId id);

  void deleteTodo(ObjectId id);

  Stream<List<Todo>> getAllTodos();

  Stream<RealmResultsChanges> listenForLocalChanges();
}
