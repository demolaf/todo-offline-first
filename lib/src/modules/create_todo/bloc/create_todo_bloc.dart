import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_bloc/src/core/enums.dart';
import 'package:todo_bloc/src/data/repositories/todo/todo_repository.dart';
import 'package:todo_bloc/src/data/repositories/todo/todo_repository_impl.dart';

part 'create_todo_event.dart';

part 'create_todo_state.dart';

part 'create_todo_bloc.freezed.dart';

class CreateTodoBloc extends Bloc<CreateTodoEvent, CreateTodoState> {
  CreateTodoBloc({
    required TodoRepository todoRepository,
  })  : _todoRepository = todoRepository,
        _newTodoId = todoRepository.getGeneratedTodoId(),
        super(const CreateTodoState.initial()) {
    on<CreateTodoInitializationRequested>((event, emit) {});

    on<CreateTodo>((event, emit) async {
      await _todoRepository.createTodo(
        SourceType.local,
        id: _newTodoId,
        color: 'color',
        time: DateTime.now(),
        priority: TodoPriority.medium.name,
        description: 'Welcome back to my YouTube channel',
        title: 'Hello World',
      );
    });
  }

  final TodoRepository _todoRepository;
  final String _newTodoId;
}
