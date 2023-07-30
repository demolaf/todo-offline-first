part of 'create_todo_bloc.dart';

@freezed
class CreateTodoEvent with _$CreateTodoEvent {
  const factory CreateTodoEvent.started() = _Started;
}
