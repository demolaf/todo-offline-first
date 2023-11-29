part of 'view_todo_bloc.dart';

@freezed
class ViewTodoState with _$ViewTodoState {
  const factory ViewTodoState({
    Todo? todo,
  }) = _ViewTodoState;

  const factory ViewTodoState.loading({
    Todo? todo,
  }) = Loading;

  const factory ViewTodoState.savingTodo({
    required ProcessingState processingState,
    Todo? todo,
  }) = SavingTodo;
}
