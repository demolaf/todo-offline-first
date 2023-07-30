import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_todo_event.dart';
part 'create_todo_state.dart';
part 'create_todo_bloc.freezed.dart';

class CreateTodoBloc extends Bloc<CreateTodoEvent, CreateTodoState> {
  CreateTodoBloc() : super(const CreateTodoState.initial()) {
    on<CreateTodoEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
