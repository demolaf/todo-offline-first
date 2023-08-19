part of 'view_todo_bloc.dart';

@freezed
class ViewTodoState with _$ViewTodoState {
  const factory ViewTodoState.loading() = ViewTodoStateLoading;

  const factory ViewTodoState.ready({required Todo todo}) = ViewTodoStateReady;
}
