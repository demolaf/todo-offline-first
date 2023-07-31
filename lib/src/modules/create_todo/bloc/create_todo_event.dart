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

class CreateTodo extends CreateTodoEvent {
  const CreateTodo();

  @override
  List<Object> get props => [];
}
