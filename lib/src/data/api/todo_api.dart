import 'dart:async';
import 'dart:developer' as developer;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:realm/realm.dart';
import 'package:todo_bloc/src/data/local_storage/local_storage.dart';
import 'package:todo_bloc/src/data/models/todo/todo_dto.dart';
import 'package:todo_bloc/src/data/repositories/todo/todo_repository_impl.dart';

class TodoApi {
  TodoApi({
    required LocalStorage localStorage,
  })  : _localStorage = localStorage,
        _todosRef = FirebaseFirestore.instance.collection('todos');

  final LocalStorage _localStorage;
  final CollectionReference _todosRef;

  // TODO(demolaf): when editing a todo we have set the synced value to false

  /// We use this to ensure that we only create and update
  /// the one new object at a time from the create_todo user interface
  String generateTodoId() {
    return ObjectId().hexString;
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

  /// Get all todos from sources - local or remote
  Stream<List<TodoDTO>> getAllTodos(SourceType sourceType) {
    try {
      switch (sourceType) {
        case SourceType.local:
          return _localStorage
              .readAllAsStream<TodoDTO>()
              .asyncMap((event) => event.results.toList());
        case SourceType.remote:
          return _todosRef.snapshots().asyncMap(
                (event) => event.docs
                    .map(
                      (e) => TodoDTOJsonParser.fromJson(
                        e.data()! as Map<String, dynamic>,
                      ),
                    )
                    .toList(),
              );
      }
    } catch (e) {
      developer.log(e.toString());
      rethrow;
    }
  }

  /// Fetch un-synced todos from local
  List<TodoDTO> fetchUnSyncedTodos() {
    return _localStorage.read<TodoDTO>(r'synced == $0', [false]).toList();
  }

  /// Push un-synced todos to remote
  Future<void> pushUnSyncedTodosToRemote() async {
    try {
      final todos = fetchUnSyncedTodos();
      // check internet connection
      for (final todo in todos) {
        final docRef = _todosRef.doc(todo.id.hexString);

        // Set to synced in firestore, not sure if it's needed
        await docRef.set(todo.copyWith(synced: true).toJson());

        // Update the todo_object in local
        await _localStorage.update<TodoDTO>(() {
          // Set to synced to avoid syncing again
          todo.synced = true;
        });
      }
    } catch (e) {
      developer.log(e.toString());
      rethrow;
    }
  }

  /// Removes all data from the local after unsynced todos have been synced
  /// Then fetches all the todos from firestore and stores in local
  /// Which ensures an up-to-date and refreshed data set
  Future<void> cacheRefresh() async {
    // Check if there's a connection first
    try {
      await _localStorage.deleteAll<TodoDTO>();

      final todos = await getAllTodos(SourceType.remote).first;

      await _localStorage.addAll(todos);
    } catch (e) {
      developer.log(e.toString());
      rethrow;
    }
  }
}
