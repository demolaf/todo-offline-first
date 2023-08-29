part of 'create_todo_bloc.dart';

@freezed
class CreateTodoState with _$CreateTodoState {
  const factory CreateTodoState({
    Todo? todo,
  }) = _CreateTodoState;

  const factory CreateTodoState.loading({
    Todo? todo,
  }) = CreatingTodoLoading;

  const factory CreateTodoState.savingTodo({
    required ProcessingState processingState,
    Todo? todo,
  }) = SavingTodo;
}
