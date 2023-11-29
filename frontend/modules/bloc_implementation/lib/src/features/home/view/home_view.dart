import 'package:bloc_implementation/src/features/connection_checker/bloc/connection_checker_bloc.dart';
import 'package:bloc_implementation/src/features/home/bloc/home_bloc.dart';
import 'package:bloc_implementation/src/features/home/view/pages/queues_view.dart';
import 'package:bloc_implementation/src/features/home/view/widgets/animated_sync_status.dart';
import 'package:bloc_implementation/src/features/home/view/widgets/todo_list_view_builder.dart';
import 'package:bloc_implementation/src/features/todo_sync/cubit/todo_sync_cubit.dart';
import 'package:bloc_implementation/src/features/view_todo/view/view_todo_view.dart';
import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repositories/repositories.dart';

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
                  Expanded(
                    child: TodoListViewBuilder(
                      today: state.today,
                      completed: state.completed,
                      upcoming: state.upcoming,
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
            ViewTodoView.route(todoOperationType: TodoOperationType.create),
          );
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
