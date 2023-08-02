part of 'create_todo_bloc.dart';

abstract class CreateTodoEvent extends Equatable {
  const CreateTodoEvent();

  @override
  List<Object> get props => [];
}

// class CreateTodoInitializationRequested extends CreateTodoEvent {
//   const CreateTodoInitializationRequested();
//
//   @override
//   List<Object> get props => [];
// }

class CreateTodo extends CreateTodoEvent {
  const CreateTodo({
    required this.title,
    required this.description,
    required this.color,
    required this.priority,
    required this.time,
  });

  final String title;
  final String description;
  final String color;
  final TodoPriority priority;
  final DateTime time;

  @override
  List<Object> get props => [title, description, color, priority];
}
