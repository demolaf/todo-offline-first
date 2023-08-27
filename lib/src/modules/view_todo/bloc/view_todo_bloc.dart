import 'dart:developer' as developer;
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
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
    on<FetchTodo>((event, emit) async {
      try {
        final todo = await _todoRepository.getTodo(event.id);

        emit(ViewTodoState.ready(todo: todo!));
      } catch (e) {
        developer.log(e.toString());
      }
    });

    on<ModifyTodo>((event, emit) async {});

    on<DeleteTodo>((event, emit) async {
      _todoRepository.deleteTodo(event.id);
      await _todoSyncRepository.createQueueForTodo(
        operationType: QueueOperationType.delete,
        id: event.id,
      );
    });
  }

  final TodoRepository _todoRepository;
  final TodoSyncRepository _todoSyncRepository;
}
