import 'dart:developer' as developer;
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_bloc/src/core/enums/enums.dart';
import 'package:todo_bloc/src/data/repositories/todo/todo_repository.dart';

part 'create_todo_event.dart';

part 'create_todo_state.dart';

part 'create_todo_bloc.freezed.dart';

class CreateTodoBloc extends Bloc<CreateTodoEvent, CreateTodoState> {
  CreateTodoBloc({
    required TodoRepository todoRepository,
  })  : _todoRepository = todoRepository,
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
  final String _newTodoId;
}
