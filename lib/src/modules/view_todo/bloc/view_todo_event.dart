part of 'view_todo_bloc.dart';

abstract class ViewTodoEvent extends Equatable {
  const ViewTodoEvent();

  @override
  List<Object> get props => [];
}

class ViewTodoInitializationRequested extends ViewTodoEvent {
  const ViewTodoInitializationRequested({
    required this.todoOperationType,
    this.id,
  });

  final TodoOperationType todoOperationType;
  final String? id;

  @override
  List<Object> get props => [];
}

class TodoDataChanged extends ViewTodoEvent {
  const TodoDataChanged({required this.todo});

  final Todo todo;

  @override
  List<Object> get props => [todo];
}

class SaveTodo extends ViewTodoEvent {
  const SaveTodo({required this.todoOperationType});

  final TodoOperationType todoOperationType;

  @override
  List<Object> get props => [];
}

class DeleteTodo extends ViewTodoEvent {
  const DeleteTodo();

  @override
  List<Object> get props => [];
}
