part of 'create_todo_bloc.dart';

@freezed
class CreateTodoState with _$CreateTodoState {
  const factory CreateTodoState.initial() = _Initial;

  const factory CreateTodoState.loading() = CreateTodoStateLoading;

  const factory CreateTodoState.ready() = CreateTodoStateReady;

  const factory CreateTodoState.creatingTodo() = CreatingTodo;
}
