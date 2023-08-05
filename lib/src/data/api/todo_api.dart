import 'dart:async';
import 'dart:developer' as developer;
import 'package:realm/realm.dart';
import 'package:todo_bloc/src/data/local_storage/local_storage.dart';
import 'package:todo_bloc/src/data/models/dtos/todo/todo_dto.dart';

class TodoApi {
  TodoApi({
    required LocalStorage localStorage,
  }) : _localStorage = localStorage;

  final LocalStorage _localStorage;

  // TODO(demolaf): when editing a todo we have set the synced value to false

  /// We use this to ensure that we only create and update
  /// the one new object at a time from the create_todo user interface
  String generateTodoId() {
    return ObjectId().hexString;
  }

  TodoDTO getTodo(ObjectId id) {
    return _localStorage.read<TodoDTO>(r'id == $0', [id]).first;
  }

  /// Create a todo_object and store in local
  Future<void> createTodo({
    required String id,
    required String color,
    required DateTime time,
    required String priority,
    required String description,
    required String title,
  }) async {
    try {
      final newTodo = TodoDTO(
        ObjectId.fromHexString(id),
        color,
        time.toIso8601String(),
        priority,
        description,
        title,
        false,
        false,
      );
      await _localStorage.create(newTodo);
    } catch (e) {
      developer.log(e.toString());
    }
  }

  void deleteTodo(ObjectId id) {
    final todo = getTodo(id);
    _localStorage.delete(todo);
  }

  Stream<RealmResultsChanges> listenForChangesInLocal() {
    return _localStorage.readAllAsStream<TodoDTO>();
  }

  /// Handles fetching todos from local or cloud
  Stream<List<TodoDTO>> fetchAllTodos() {
    return _fetchTodosFromLocal();
  }

  bool checkEmptyTodosInLocal() => _localStorage.readAll<TodoDTO>().isEmpty;

  /// Fetch todos from cloud db
  // Stream<List<TodoDTO>> _fetchTodosFromRemote() {
  //   final user = _localStorage.readAll<UserDTO>().first;
  //
  //   return _todosRef.doc(user.uid).snapshots().asyncMap((event) {
  //     final todoResponse = event.data() as Map<String, dynamic>?;
  //
  //     if (todoResponse != null) {
  //       final todos = todoResponse['todos'] as List<dynamic>;
  //
  //       return todos
  //           .map(
  //             (e) => TodoDTOJsonParser.fromJson(e as Map<String, dynamic>),
  //           )
  //           .toList();
  //     }
  //
  //     return [];
  //   });
  // }

  /// Fetch todos from local db
  Stream<List<TodoDTO>> _fetchTodosFromLocal() => _localStorage
      .readAllAsStream<TodoDTO>()
      .asyncMap((event) => event.results.toList());
}
