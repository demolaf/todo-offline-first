import 'dart:developer' as developer;
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_bloc/src/core/enums/enums.dart';
import 'package:todo_bloc/src/data/models/domains/todo.dart';
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
        super(const CreateTodoState.loading()) {
    on<CreateTodoInitializationRequested>((event, emit) {
      emit(
        state.copyWith(
          newTodo: Todo(
            id: todoRepository.getGeneratedTodoId(),
            title: '',
            description: '',
            synced: false,
            completed: false,
          ),
        ),
      );
    });

    on<UpdateTodo>((event, emit) async {
      emit(state.copyWith(newTodo: event.todo));
    });

    on<SaveTodo>((event, emit) async {
      if (state.newTodo!.title.isEmpty && state.newTodo!.description.isEmpty) {
        return;
      }

      try {
        emit(
          CreateTodoState.creatingTodo(
            processingState: ProcessingState.processing,
            newTodo: state.newTodo,
          ),
        );

        await _todoRepository.createTodo(todo: state.newTodo!);

        await _todoSyncRepository.createQueueForTodo(
          operationType: QueueOperationType.create,
          id: state.newTodo!.id,
        );

        emit(
          CreateTodoState.creatingTodo(
            processingState: ProcessingState.success,
            newTodo: state.newTodo,
          ),
        );
      } catch (e) {
        developer.log('HERE: $e');
        emit(
          CreateTodoState.creatingTodo(
            processingState: ProcessingState.failure,
            newTodo: state.newTodo,
          ),
        );
      }
    });
  }

  final TodoRepository _todoRepository;
  final TodoSyncRepository _todoSyncRepository;
}
