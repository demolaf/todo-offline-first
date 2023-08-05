import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_bloc/src/data/models/domains/todo.dart';
import 'package:todo_bloc/src/data/repositories/todo/todo_repository.dart';

part 'home_bloc.freezed.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required TodoRepository todoRepository,
  })  : _todoRepository = todoRepository,
        super(const HomeState.initial()) {
    on<HomeInitializationRequested>((event, emit) async {
      await emit.onEach(
        _todoRepository.listenForLocalChanges(),
        onData: (data) async {
          final todos = await _todoRepository.getAllTodos().first;
          emit(HomeState.ready(todos: todos));
        },
      );
    });
  }

  final TodoRepository _todoRepository;
}
