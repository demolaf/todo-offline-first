import 'package:todo_bloc/src/core/global_imports.dart';
import 'package:todo_bloc/src/data/models/todo/todo_dto.dart';
import 'package:todo_bloc/src/modules/home/view/widgets/todo_list_item.dart';

class TodaysTodosListView extends StatelessWidget {
  const TodaysTodosListView({
    required this.todos,
    super.key,
  });

  final List<TodoDTO> todos;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        return TodoListItem(
          todo: todos[index],
        );
      },
    );
  }
}
