part of 'create_todo_bloc.dart';

abstract class CreateTodoEvent extends Equatable {
  const CreateTodoEvent();

  @override
  List<Object> get props => [];
}

class CreateTodoInitializationRequested extends CreateTodoEvent {
  const CreateTodoInitializationRequested();

  @override
  List<Object> get props => [];
}

class UpdateTodo extends CreateTodoEvent {
  const UpdateTodo({required this.todo});

  final Todo todo;

  @override
  List<Object> get props => [todo];
}

class SaveTodo extends CreateTodoEvent {
  const SaveTodo();
}
