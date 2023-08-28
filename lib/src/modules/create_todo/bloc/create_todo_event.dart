part of 'create_todo_bloc.dart';

abstract class CreateTodoEvent extends Equatable {
  const CreateTodoEvent();

  @override
  List<Object> get props => [];
}

class CreateTodoInitializationRequested extends CreateTodoEvent {
  const CreateTodoInitializationRequested({
    required this.todoOperationType,
    this.id,
  });

  final TodoOperationType todoOperationType;
  final String? id;

  @override
  List<Object> get props => [];
}

class TodoDataChanged extends CreateTodoEvent {
  const TodoDataChanged({required this.todo});

  final Todo todo;

  @override
  List<Object> get props => [todo];
}

class SaveTodo extends CreateTodoEvent {
  const SaveTodo({required this.todoOperationType});

  final TodoOperationType todoOperationType;

  @override
  List<Object> get props => [];
}

class DeleteTodo extends CreateTodoEvent {
  const DeleteTodo();

  @override
  List<Object> get props => [];
}
