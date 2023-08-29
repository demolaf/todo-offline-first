import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_bloc/src/core/enums/enums.dart';
import 'package:todo_bloc/src/core/enums/todo_operation_type.dart';
import 'package:todo_bloc/src/data/models/domains/todo.dart';
import 'package:todo_bloc/src/data/models/dtos/queue/queue_dto.dart';
import 'package:todo_bloc/src/data/repositories/todo/todo_repository.dart';
import 'package:todo_bloc/src/data/repositories/todo_sync/todo_sync_repository.dart';

part 'view_todo_bloc.freezed.dart';
part 'view_todo_event.dart';
part 'view_todo_state.dart';

class ViewTodoBloc extends Bloc<ViewTodoEvent, ViewTodoState> {
  ViewTodoBloc({
    required TodoRepository todoRepository,
    required TodoSyncRepository todoSyncRepository,
  })  : _todoRepository = todoRepository,
        _todoSyncRepository = todoSyncRepository,
        super(const ViewTodoState.loading()) {
    on<ViewTodoInitializationRequested>((event, emit) async {
      switch (event.todoOperationType) {
        case TodoOperationType.create:
          emit(
            state.copyWith(
              todo: Todo(
                id: todoRepository.getGeneratedTodoId(),
                title: '',
                description: '',
                synced: false,
                completed: false,
              ),
            ),
          );
        case TodoOperationType.edit:
          final todo = await _todoRepository.getTodo(event.id!);
          emit(
            state.copyWith(
              todo: todo,
            ),
          );
      }
    });

    on<TodoDataChanged>((event, emit) async {
      emit(state.copyWith(todo: event.todo));
    });

    on<SaveTodo>((event, emit) async {
      if (state.todo!.title.isEmpty && state.todo!.description.isEmpty) {
        return;
      }

      try {
        emit(
          ViewTodoState.savingTodo(
            processingState: ProcessingState.processing,
            todo: state.todo,
          ),
        );

        await _todoRepository.upsertTodo(todo: state.todo!);

        switch (event.todoOperationType) {
          case TodoOperationType.create:
            await _todoSyncRepository.createQueueForTodo(
              operationType: QueueOperationType.create,
              id: state.todo!.id,
            );
          case TodoOperationType.edit:
            await _todoSyncRepository.createQueueForTodo(
              operationType: QueueOperationType.update,
              id: state.todo!.id,
            );
        }

        emit(
          ViewTodoState.savingTodo(
            processingState: ProcessingState.success,
            todo: state.todo,
          ),
        );
      } catch (e) {
        developer.log('HERE: $e');
        emit(
          ViewTodoState.savingTodo(
            processingState: ProcessingState.failure,
            todo: state.todo,
          ),
        );
      }
    });

    on<DeleteTodo>((event, emit) async {
      _todoRepository.deleteTodo(state.todo!.id);
      await _todoSyncRepository.createQueueForTodo(
        operationType: QueueOperationType.delete,
        id: state.todo!.id,
      );
    });
  }

  final TodoRepository _todoRepository;
  final TodoSyncRepository _todoSyncRepository;

  Todo? getTodo() {
    return state.todo;
  }
}
