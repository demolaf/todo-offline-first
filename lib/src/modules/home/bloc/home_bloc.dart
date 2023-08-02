import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_bloc/src/data/models/todo/todo_dto.dart';
import 'package:todo_bloc/src/data/repositories/todo/todo_repository.dart';
import 'package:todo_bloc/src/data/repositories/todo/todo_repository_impl.dart';

part 'home_event.dart';

part 'home_state.dart';

part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required TodoRepository todoRepository})
      : _todoRepository = todoRepository,
        super(const HomeState.initial()) {
    on<HomeInitializationRequested>((event, emit) async {
      await emit.onEach(
        _todoRepository.getAllTodos(event.sourceType),
        onData: (data) {
          emit(HomeState.ready(todos: data));
        },
      );
    });
  }

  final TodoRepository _todoRepository;
}
