import 'package:apis/apis.dart';
import 'package:bloc_implementation/src/features/home/view/widgets/todo_list_item.dart';
import 'package:flutter/material.dart';

class TodoSectionListView extends StatelessWidget {
  const TodoSectionListView({
    required this.todos,
    super.key,
  });

  final List<Todo> todos;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        return TodoSectionListItem(
          todo: todos[index],
        );
      },
    );
  }
}
