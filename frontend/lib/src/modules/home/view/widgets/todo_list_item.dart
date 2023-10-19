import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:todo_bloc/src/core/enums/todo_operation_type.dart';
import 'package:todo_bloc/src/core/global_imports.dart';
import 'package:todo_bloc/src/data/models/domains/todo.dart';
import 'package:todo_bloc/src/modules/view_todo/view/view_todo_view.dart';

class TodoSectionListItem extends StatelessWidget {
  const TodoSectionListItem({
    required this.todo,
    super.key,
  });

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          ViewTodoView.route(
            todoOperationType: TodoOperationType.edit,
            todo: todo,
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 24),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Theme.of(context).colorScheme.primary,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    todo.title,
                    maxLines: 2,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                if (todo.synced ?? false)
                  const Icon(Icons.check_rounded)
                else
                  const Icon(Icons.sync),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.calendar_month_rounded,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      DateTime.parse(todo.time!).formatDateOnly(),
                    ),
                  ],
                ),
                const SizedBox(width: 24),
                Row(
                  children: [
                    const Icon(
                      Icons.access_time_rounded,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      DateTime.parse(todo.time!).formatTimeOnly(),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              decoration: ShapeDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                shape: const StadiumBorder(),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Transform.scale(
                        scale: 1.5,
                        child: SizedBox(
                          width: 24,
                          height: 24,
                          child: Checkbox(
                            value: false,
                            side: BorderSide(
                              color: Theme.of(context).primaryColor,
                            ),
                            onChanged: (value) {},
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'Mark as completed',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 12,
                        ),
                        decoration: ShapeDecoration(
                          color: todo.priority?.toTodoPriority().toColor(),
                          shape: const StadiumBorder(),
                        ),
                        child: Text(
                          '${todo.priority?.capitalize}',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
