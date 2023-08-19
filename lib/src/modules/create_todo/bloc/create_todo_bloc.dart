import 'dart:developer' as developer;
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_bloc/src/core/enums/enums.dart';
import 'package:todo_bloc/src/data/models/dtos/queue/queue_dto.dart';
import 'package:todo_bloc/src/data/repositories/todo/todo_repository.dart';
import 'package:todo_bloc/src/data/repositories/todo_sync/todo_sync_repository.dart';

part 'create_todo_event.dart';

part 'create_todo_state.dart';

part 'create_todo_bloc.freezed.dart';

class CreateTodoBloc extends Bloc<CreateTodoEvent, CreateTodoState> {
  CreateTodoBloc({
    required TodoRepository todoRepository,
    required TodoSyncRepository todoSyncRepository,
  })  : _todoRepository = todoRepository,
        _todoSyncRepository = todoSyncRepository,
        _newTodoId = todoRepository.getGeneratedTodoId(),
        super(const CreateTodoState.loading()) {
    // on<CreateTodoInitializationRequested>((event, emit) {
    //
    // });

    on<CreateTodo>((event, emit) async {
      try {
        emit(
          const CreateTodoState.creatingTodo(
            processingState: ProcessingState.processing,
          ),
        );

        await _todoRepository.createTodo(
          id: _newTodoId,
          title: event.title,
          description: event.description,
          color: event.color,
          priority: event.priority.name,
          time: event.time,
        );

        await _todoSyncRepository.createQueueForTodo(
          operationType: QueueOperationType.create,
          id: _newTodoId,
        );

        emit(
          const CreateTodoState.creatingTodo(
            processingState: ProcessingState.success,
          ),
        );
      } catch (e) {
        developer.log(e.toString());
        emit(
          const CreateTodoState.creatingTodo(
            processingState: ProcessingState.failure,
          ),
        );
      }
    });
  }

  final TodoRepository _todoRepository;
  final TodoSyncRepository _todoSyncRepository;
  final String _newTodoId;
}
