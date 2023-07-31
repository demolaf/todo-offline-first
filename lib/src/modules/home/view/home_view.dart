import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/src/core/enums.dart';
import 'package:todo_bloc/src/core/shared/shared.dart';
import 'package:todo_bloc/src/data/models/todo/todo_dto.dart';
import 'package:todo_bloc/src/data/repositories/todo/todo_repository.dart';
import 'package:todo_bloc/src/modules/connection_checker/bloc/connection_checker_bloc.dart';
import 'package:todo_bloc/src/modules/create_todo/view/create_todo_view.dart';
import 'package:todo_bloc/src/modules/home/bloc/home_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  static Route<HomeView> route() {
    return MaterialPageRoute(
      builder: (context) {
        return BlocProvider(
          create: (context) {
            return HomeBloc(
              todoRepository: context.read<TodoRepository>(),
            )..add(const HomeInitializationRequested());
          },
          child: const HomeView(),
        );
      },
    );
  }

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TodoStatus selected = TodoStatus.today;
  FocusNode? searchTextFieldFocusNode;

  @override
  void initState() {
    super.initState();
    searchTextFieldFocusNode = FocusNode();
  }

  @override
  void dispose() {
    searchTextFieldFocusNode?.dispose();
    super.dispose();
  }

  void showSnackBar({required String message, Icon? icon}) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        CustomSnackBarBuilder(
          icon: icon ??
              Icon(
                Icons.warning_rounded,
                color: Colors.red.shade500,
                size: 48,
              ),
          title: message,
          // titleColor: Colors.white,
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    // final width = MediaQuery.of(context).size.width;
    // final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        // titleSpacing: 20,
        title: const Text('Todos'),
        centerTitle: false,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 24),
            child: Row(
              children: [
                Icon(
                  Icons.person,
                ),
                SizedBox(width: 24),
                Icon(
                  Icons.settings_rounded,
                ),
              ],
            ),
          ),
        ],
      ),
      body: BlocListener<ConnectionCheckerBloc, ConnectionCheckerState>(
        listener: (context, state) {
          if (state is ConnectionCheckerStateReady) {
            if (state.connected) {
              showSnackBar(
                icon: const Icon(
                  Icons.check_rounded,
                  color: Colors.green,
                ),
                message: 'Connected',
              );
            } else {
              showSnackBar(
                message: 'No Network',
              );
            }
          }
        },
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is! HomeStateReady) {
              return const CircularProgressIndicator();
            }

            return Padding(
              padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CupertinoSearchTextField(
                    prefixIcon: const Icon(Icons.search_rounded),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    focusNode: searchTextFieldFocusNode,
                    enabled: false,
                  ),
                  const SizedBox(height: 24),
                  const Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Welcome back!'),
                          Text('John Doe'),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
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
                          case TodoStatus.today:
                            return TodaysTodos(
                              todos: state.todos,
                            );
                          case TodoStatus.upcoming:
                            return Container();
                          case TodoStatus.completed:
                            return Container();
                        }
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(
            CreateTodoView.route(todoActionType: TodoActionType.create),
          );
        },
        icon: const Icon(
          Icons.add_box_rounded,
        ),
        label: const Text('Create Todo'),
      ),
    );
  }
}

class TodaysTodos extends StatelessWidget {
  const TodaysTodos({
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

class TodoListItem extends StatelessWidget {
  const TodoListItem({
    required this.todo,
    super.key,
  });

  final TodoDTO todo;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(CreateTodoView.route(todoActionType: TodoActionType.edit));
      },
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: Container(
          margin: const EdgeInsets.only(bottom: 24),
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: Theme.of(context).colorScheme.primaryContainer,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(todo.title),
                  SizedBox(
                    width: 24,
                    child: IconButton(
                      onPressed: () {},
                      padding: EdgeInsets.zero,
                      icon: Icon(Icons.adaptive.share_rounded),
                    ),
                  ),
                ],
              ),
              const Row(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_month_rounded,
                      ),
                      SizedBox(width: 6),
                      Text('12 October'),
                    ],
                  ),
                  SizedBox(width: 24),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time_rounded,
                      ),
                      SizedBox(width: 6),
                      Text('10:15pm'),
                    ],
                  ),
                ],
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                decoration: ShapeDecoration(
                  color: Theme.of(context).colorScheme.secondaryContainer,
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
                        const Text(
                          'Mark as completed',
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
                            color: Theme.of(context)
                                .colorScheme
                                .secondaryContainer,
                            shape: const StadiumBorder(),
                          ),
                          child: const Text('Medium'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTab extends StatelessWidget {
  const CustomTab({
    required this.selected,
    required this.title,
    super.key,
  });

  final bool selected;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: selected
          ? BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(24),
            )
          : null,
      child: Text(
        title,
      ),
    );
  }
}
