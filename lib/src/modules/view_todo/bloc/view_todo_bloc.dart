import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:realm/realm.dart';
import 'package:todo_bloc/src/data/models/domains/todo.dart';
import 'package:todo_bloc/src/data/models/dtos/queue/queue_dto.dart';
import 'package:todo_bloc/src/data/repositories/todo/todo_repository.dart';
import 'package:todo_bloc/src/data/repositories/todo_sync/todo_sync_repository.dart';

part 'view_todo_bloc.freezed.dart';

part 'view_todo_event.dart';

part 'view_todo_state.dart';

class ViewTodoBloc extends Bloc<EditTodoEvent, ViewTodoState> {
  ViewTodoBloc({
    required TodoRepository todoRepository,
    required TodoSyncRepository todoSyncRepository,
  })  : _todoRepository = todoRepository,
        _todoSyncRepository = todoSyncRepository,
        super(const ViewTodoState.loading()) {
    on<FetchTodo>((event, emit) {
      final todo = _todoRepository.getTodo(event.id);

      emit(ViewTodoState.ready(todo: todo));
    });

    on<ModifyTodo>((event, emit) async {});

    on<DeleteTodo>((event, emit) async {
      _todoRepository.deleteTodo(event.id);
      await _todoSyncRepository.createDeleteQueueForTodo(
        operationType: QueueOperationType.delete,
        id: event.id.hexString,
      );
    });
  }

  final TodoRepository _todoRepository;
  final TodoSyncRepository _todoSyncRepository;
}
