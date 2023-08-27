import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/src/core/enums/enums.dart';
import 'package:todo_bloc/src/core/shared/shared.dart';
import 'package:todo_bloc/src/data/repositories/todo/todo_repository.dart';
import 'package:todo_bloc/src/modules/connection_checker/bloc/connection_checker_bloc.dart';
import 'package:todo_bloc/src/modules/create_todo/view/create_todo_view.dart';
import 'package:todo_bloc/src/modules/home/bloc/home_bloc.dart';
import 'package:todo_bloc/src/modules/home/view/pages/device_info_view.dart';
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
    // final width = MediaQuery.of(context).size.width;
    // final height = MediaQuery.of(context).size.height;
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
            padding: const EdgeInsets.only(right: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Icon(
                  Icons.person,
                ),
                const Icon(
                  Icons.settings_rounded,
                ),
                IconButton(
                  icon: const Icon(Icons.cloud),
                  onPressed: () {
                    Navigator.of(context)
                        .push(QueuesView.route(bloc: context.read<HomeBloc>()));
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.perm_device_info_rounded),
                  onPressed: () {
                    Navigator.of(context).push(DeviceInfoView.route());
                  },
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
                          case TodoStatus.today when state.todos.isEmpty:
                            return Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.note_add,
                                    size: 48,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .tertiaryContainer,
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    'You have no todos',
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                ],
                              ),
                            );
                          case TodoStatus.today:
                            return TodaysTodosListView(
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
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(CreateTodoView.route());
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
