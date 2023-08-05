part of 'create_todo_bloc.dart';

enum ProcessingState {
  processing,
  success,
  failure,
}

@freezed
class CreateTodoState with _$CreateTodoState {
  const factory CreateTodoState.loading() = Loading;

  const factory CreateTodoState.ready() = Ready;

  const factory CreateTodoState.creatingTodo({
    required ProcessingState processingState,
  }) = CreatingTodo;
}
