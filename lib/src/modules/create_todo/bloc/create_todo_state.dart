part of 'create_todo_bloc.dart';

@freezed
class CreateTodoState with _$CreateTodoState {
  const factory CreateTodoState({
    Todo? newTodo,
  }) = _CreateTodoState;

  const factory CreateTodoState.loading({
    Todo? newTodo,
  }) = CreatingTodoLoading;

  const factory CreateTodoState.creatingTodo({
    required ProcessingState processingState,
    Todo? newTodo,
  }) = CreatingTodo;
}
