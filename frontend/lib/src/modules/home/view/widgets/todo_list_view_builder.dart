import 'package:flutter/material.dart';
import 'package:todo_bloc/src/core/enums/enums.dart';
import 'package:todo_bloc/src/data/models/domains/todo.dart';
import 'package:todo_bloc/src/modules/home/view/widgets/empty_list_state.dart';
import 'package:todo_bloc/src/modules/home/view/widgets/todays_todos_list_view.dart';

class TodoListViewBuilder extends StatefulWidget {
  const TodoListViewBuilder({
    required this.today,
    required this.upcoming,
    required this.completed,
    super.key,
  });

  final List<Todo> today;
  final List<Todo> upcoming;
  final List<Todo> completed;

  @override
  State<TodoListViewBuilder> createState() => _TodoListViewBuilderState();
}

class _TodoListViewBuilderState extends State<TodoListViewBuilder> {
  TodoStatus selected = TodoStatus.today;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.maxFinite,
          child: SegmentedButton<TodoStatus>(
            showSelectedIcon: false,
            segments: TodoStatus.values
                .map(
                  (status) => ButtonSegment(
                    value: status,
                    label: Text(
                      status.name.toUpperCase(),
                      maxLines: 1,
                    ),
                  ),
                )
                .toList(),
            selected: {selected},
            onSelectionChanged: (newSelection) {
              setState(() {
                selected = newSelection.first;
              });
            },
          ),
        ),
        const SizedBox(height: 24),
        Expanded(
          child: PageView.builder(
            itemCount: TodoStatus.values.length,
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: (page) {
              setState(() {
                selected = page.todoStatus();
              });
            },
            itemBuilder: (context, index) {
              switch (selected) {
                case TodoStatus.today when widget.today.isEmpty:
                  return const EmptyListState(
                    sectionTitle: 'today',
                  );
                case TodoStatus.upcoming when widget.upcoming.isEmpty:
                  return const EmptyListState(
                    sectionTitle: 'upcoming',
                  );
                case TodoStatus.completed when widget.completed.isEmpty:
                  return const EmptyListState(
                    sectionTitle: 'completed',
                  );
                case TodoStatus.today:
                  return TodoSectionListView(
                    todos: widget.today,
                  );
                case TodoStatus.upcoming:
                  return TodoSectionListView(
                    todos: widget.upcoming,
                  );
                case TodoStatus.completed:
                  return TodoSectionListView(
                    todos: widget.completed,
                  );
              }
            },
          ),
        ),
      ],
    );
  }
}
