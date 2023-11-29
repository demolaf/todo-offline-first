import 'package:apis/src/apis/todo/todo_api.dart';
import 'package:apis/src/models/todo/dto/todo_dto.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';

class RemoteTodoApi extends TodoApi {
  RemoteTodoApi({
    required String userId,
    required FirebaseFirestore firestore,
  })  : _userId = userId,
        _todosRef = firestore.collection('todos');

  final String _userId;
  final CollectionReference _todosRef;

  @override
  Future<void> createTodo(TodoDTO todo) async {
    final docRef = _getUserTodosDocRef();

    final todosInRemote = await _getTodosAsFuture();

    final todosToSyncJson = <Map<String, dynamic>>[
      ...todosInRemote.map((e) => e.toJson()),
      todo.toJson(),
    ];

    await docRef.set({'todos': todosToSyncJson});
  }

  @override
  Future<void> deleteTodo(String id) async {
    final docRef = _getUserTodosDocRef();

    final todosInRemote = await _getTodosAsFuture();

    todosInRemote.removeWhere((element) => element.id.hexString == id);

    final todosToSyncJson = <Map<String, dynamic>>[
      ...todosInRemote.map((e) => e.toJson()),
    ];

    await docRef.update({'todos': todosToSyncJson});
  }

  @override
  Future<TodoDTO?> getTodo(String id) async {
    final todos = await _getTodosAsFuture();

    return todos.firstWhereOrNull(
      (element) => element.id.hexString == id,
    );
  }

  @override
  Stream<List<TodoDTO>> getTodos() {
    final docRef = _getUserTodosDocRef();

    return docRef.snapshots().asyncMap((event) {
      final todosResponse = event.data() as Map<String, dynamic>?;

      if (todosResponse != null) {
        final todos = todosResponse['todos'] as List<dynamic>;
        return todos
            .map((e) => TodoDTOJsonParser.fromJson(e as Map<String, dynamic>))
            .toList();
      }

      return <TodoDTO>[];
    });
  }

  @override
  Future<void> updateTodo(TodoDTO todo) async {
    final docRef = _getUserTodosDocRef();

    final todosInRemote = await _getTodosAsFuture();

    todosInRemote.removeWhere((element) => element.id == todo.id);

    final todosToSyncJson = <Map<String, dynamic>>[
      ...todosInRemote.map((e) => e.toJson()),
      todo.toJson(),
    ];

    await docRef.update({'todos': todosToSyncJson});
  }

  Future<List<TodoDTO>> _getTodosAsFuture() {
    final docRef = _getUserTodosDocRef();

    return docRef.get().then((value) {
      final todosResponse = value.data() as Map<String, dynamic>?;

      if (todosResponse != null) {
        final todos = todosResponse['todos'] as List<dynamic>;
        return todos
            .map((e) => TodoDTOJsonParser.fromJson(e as Map<String, dynamic>))
            .toList();
      }

      return <TodoDTO>[];
    });
  }

  DocumentReference<Object?> _getUserTodosDocRef() => _todosRef.doc(_userId);
}
