import 'package:apis/apis.dart';
import 'package:realm/realm.dart';
import 'package:repositories/src/todo/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  TodoRepositoryImpl({
    required TodoApi todoApi,
  }) : _todoApi = todoApi;

  final TodoApi _todoApi;

  /// We use this to ensure that we only create and update
  /// the one new object at a time from the create_todo user interface
  @override
  String getGeneratedTodoId() {
    return ObjectId().hexString;
  }

  @override
  Future<void> upsertTodo({required Todo todo}) async {
    await _todoApi.createTodo(
      TodoDTO(
        ObjectId.fromHexString(todo.id),
        todo.color!,
        todo.time!,
        todo.priority!,
        todo.description,
        todo.title,
        DateTime.now().toIso8601String(),
        false,
        todo.completed ?? false,
      ),
    );
  }

  @override
  Stream<List<Todo>> getAllTodos() => _todoApi
      .getTodos()
      .map((event) => event.map((e) => e.toPlainObject()).toList());

  @override
  Future<Todo?> getTodo(String id) async {
    return _todoApi.getTodo(id).then((value) => value?.toPlainObject());
  }

  @override
  void deleteTodo(String id) {
    _todoApi.deleteTodo(id);
  }
}
