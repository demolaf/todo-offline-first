part of 'view_todo_bloc.dart';

abstract class EditTodoEvent extends Equatable {
  const EditTodoEvent();

  @override
  List<Object> get props => [];
}

class FetchTodo extends EditTodoEvent {
  const FetchTodo({required this.id});

  final String id;

  @override
  List<Object> get props => [id];
}

class DeleteTodo extends EditTodoEvent {
  const DeleteTodo({required this.id});

  final String id;

  @override
  List<Object> get props => [id];
}

class ModifyTodo extends EditTodoEvent {
  const ModifyTodo();

  @override
  List<Object> get props => [];
}
