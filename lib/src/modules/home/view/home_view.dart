import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:todo_bloc/src/core/global_imports.dart';
import 'package:todo_bloc/src/data/repositories/todo/todo_repository.dart';
import 'package:todo_bloc/src/data/repositories/todo_sync/todo_sync_repository.dart';
import 'package:todo_bloc/src/modules/connection_checker/bloc/connection_checker_bloc.dart';
import 'package:todo_bloc/src/modules/create_todo/view/create_todo_view.dart';
import 'package:todo_bloc/src/modules/home/bloc/home_bloc.dart';
import 'package:todo_bloc/src/modules/home/view/pages/queues_view.dart';
import 'package:todo_bloc/src/modules/home/view/widgets/todays_todos_list_view.dart';
import 'package:todo_bloc/src/modules/todo_sync/cubit/todo_sync_cubit.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  static Route<HomeView> route() {
    return MaterialPageRoute(
      builder: (context) {
        return BlocProvider(
          create: (context) => HomeBloc(
            todoSyncRepository: context.read<TodoSyncRepository>(),
            todoRepository: context.read<TodoRepository>(),
          )..add(const HomeInitializationRequested()),
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
    return Scaffold(
      appBar: AppBar(
        // titleSpacing: 20,
        automaticallyImplyLeading: false,
        title: Text(
          "To Do's",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Row(
              children: [
                BlocSelector<TodoSyncCubit, TodoSyncState, bool>(
                  selector: (state) {
                    if (state is TodoSyncStateSyncing && state.active) {
                      return true;
                    }
                    return false;
                  },
                  builder: (context, isSyncing) {
                    if (!isSyncing) {
                      return const SizedBox.shrink();
                    }

                    return const AnimatedSyncStatus();
                  },
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(QueuesView.route(bloc: context.read<HomeBloc>()));
                  },
                  icon: Icon(
                    Icons.cloud,
                    color: Theme.of(context).colorScheme.primaryContainer,
                    size: 36,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: BlocListener<ConnectionCheckerBloc, ConnectionCheckerState>(
        listener: (context, state) {
          if (state is ConnectionCheckerStateReady) {
            context
                .read<TodoSyncCubit>()
                .synchronizingTodosWithoutTimer(connected: state.connected);

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
          buildWhen: (previous, current) =>
              previous != current && current is HomeStateReady,
          builder: (context, state) {
            if (state is! HomeStateReady) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return Padding(
              padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CupertinoSearchTextField(
                    prefixIcon: const Icon(Icons.search_rounded),
                    prefixInsets: const EdgeInsets.symmetric(horizontal: 12),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    focusNode: searchTextFieldFocusNode,
                    enabled: false,
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome!',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          Text(
                            'John Doe',
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
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
                          case TodoStatus.today when state.today.isEmpty:
                            return const EmptyListState(
                              sectionTitle: 'today',
                            );
                          case TodoStatus.upcoming when state.upcoming.isEmpty:
                            return const EmptyListState(
                              sectionTitle: 'upcoming',
                            );
                          case TodoStatus.completed
                              when state.completed.isEmpty:
                            return const EmptyListState(
                              sectionTitle: 'completed',
                            );
                          case TodoStatus.today:
                            return TodoSectionListView(
                              todos: state.today,
                            );
                          case TodoStatus.upcoming:
                            return TodoSectionListView(
                              todos: state.upcoming,
                            );
                          case TodoStatus.completed:
                            return TodoSectionListView(
                              todos: state.completed,
                            );
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
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            CreateTodoView.route(todoOperationType: TodoOperationType.create),
          );
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}

class AnimatedSyncStatus extends StatefulWidget {
  const AnimatedSyncStatus({
    super.key,
  });

  @override
  State<AnimatedSyncStatus> createState() => _AnimatedSyncStatusState();
}

class _AnimatedSyncStatusState extends State<AnimatedSyncStatus>
    with SingleTickerProviderStateMixin {
  late AnimationController _rotationAnimationController;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();

    _rotationAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..forward();

    _rotationAnimation = Tween<double>(begin: 0, end: pi * 2).animate(
      CurvedAnimation(
        parent: _rotationAnimationController,
        curve: Curves.linear,
      ),
    );
  }

  @override
  void dispose() {
    _rotationAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _rotationAnimation,
      child: Icon(
        Icons.sync,
        color: Theme.of(context).colorScheme.primaryContainer,
        size: 36,
      ),
    );
  }
}

class EmptyListState extends StatelessWidget {
  const EmptyListState({
    required this.sectionTitle,
    super.key,
  });

  final String sectionTitle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.note_add,
            size: 48,
            color: Theme.of(context).colorScheme.tertiaryContainer,
          ),
          const SizedBox(height: 16),
          Text(
            'You have no todos $sectionTitle',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
