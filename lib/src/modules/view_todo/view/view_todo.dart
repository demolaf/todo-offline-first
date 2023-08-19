import 'package:todo_bloc/src/core/global_imports.dart';
import 'package:todo_bloc/src/data/repositories/todo/todo_repository.dart';
import 'package:todo_bloc/src/data/repositories/todo_sync/todo_sync_repository.dart';
import 'package:todo_bloc/src/modules/view_todo/bloc/view_todo_bloc.dart';

class ViewTodoView extends StatelessWidget {
  const ViewTodoView({required this.id, super.key});

  static Route<ViewTodoView> route({required String id}) {
    return MaterialPageRoute(
      builder: (context) {
        return BlocProvider(
          create: (context) => ViewTodoBloc(
            todoSyncRepository: context.read<TodoSyncRepository>(),
            todoRepository: context.read<TodoRepository>(),
          )..add(FetchTodo(id: id)),
          child: ViewTodoView(id: id),
        );
      },
    );
  }

  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Todo'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    context.read<ViewTodoBloc>().add(DeleteTodo(id: id));
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: BlocBuilder<ViewTodoBloc, ViewTodoState>(
          buildWhen: (previous, current) =>
              previous != current && current is ViewTodoStateReady,
          builder: (context, state) {
            if (state is! ViewTodoStateReady) {
              return const Center(child: CircularProgressIndicator());
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  state.todo.title,
                ),
                const SizedBox(height: 24),
                Text(
                  state.todo.description,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
