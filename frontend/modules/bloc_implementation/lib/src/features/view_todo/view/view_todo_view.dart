import 'package:apis/apis.dart';
import 'package:bloc_implementation/src/features/view_todo/bloc/view_todo_bloc.dart';
import 'package:bloc_implementation/src/features/view_todo/view/widgets/extras_button.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repositories/repositories.dart';

class ViewTodoView extends StatefulWidget {
  const ViewTodoView({
    required this.todoOperationType,
    this.todo,
    super.key,
  });

  static Route<ViewTodoView> route({
    required TodoOperationType todoOperationType,
    Todo? todo,
  }) {
    return MaterialPageRoute(
      builder: (context) {
        return BlocProvider(
          create: (context) => ViewTodoBloc(
            todoSyncRepository: context.read<TodoSyncRepository>(),
            todoRepository: context.read<TodoRepository>(),
          )..add(
              ViewTodoInitializationRequested(
                todoOperationType: todoOperationType,
                id: todo?.id,
              ),
            ),
          child: ViewTodoView(todoOperationType: todoOperationType, todo: todo),
        );
      },
    );
  }

  final TodoOperationType todoOperationType;
  final Todo? todo;

  @override
  State<ViewTodoView> createState() => _ViewTodoViewState();
}

class _ViewTodoViewState extends State<ViewTodoView> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController? titleEditingController;
  TextEditingController? descriptionEditingController;
  FocusNode? titleEditingFocusNode;
  FocusNode? descriptionEditingFocusNode;

  @override
  void initState() {
    super.initState();

    initializeTextEditingControllers();
  }

  void initializeTextEditingControllers() {
    titleEditingController = TextEditingController(text: widget.todo?.title);
    titleEditingFocusNode = FocusNode();
    descriptionEditingController =
        TextEditingController(text: widget.todo?.description);
    descriptionEditingFocusNode = FocusNode();
  }

  @override
  void dispose() {
    titleEditingController?.dispose();
    titleEditingFocusNode?.dispose();
    descriptionEditingController?.dispose();
    descriptionEditingFocusNode?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            context
                .read<ViewTodoBloc>()
                .add(SaveTodo(todoOperationType: widget.todoOperationType));

            Navigator.of(context).pop();
          },
        ),
        title: Text('${widget.todoOperationType.name.capitalize} Todo'),
        actions: [
          if (widget.todoOperationType == TodoOperationType.edit)
            Padding(
              padding: const EdgeInsets.only(right: 24),
              child: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  context.read<ViewTodoBloc>().add(const DeleteTodo());
                  Navigator.of(context).pop();
                },
              ),
            ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
        child: Form(
          key: _formKey,
          child: BlocBuilder<ViewTodoBloc, ViewTodoState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Title',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              controller: titleEditingController,
                              focusNode: titleEditingFocusNode,
                              decoration: const InputDecoration(
                                hintText: 'Enter a title',
                              ),
                              onChanged: (text) {
                                context.read<ViewTodoBloc>().add(
                                      TodoDataChanged(
                                        todo: state.todo!.copyWith(
                                          title: text,
                                        ),
                                      ),
                                    );
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 24),
                      const ExtrasButton(),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Description',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            BlocSelector<ViewTodoBloc, ViewTodoState,
                                SavingTodo?>(
                              selector: (state) {
                                if (state is SavingTodo) {
                                  return state;
                                }

                                return null;
                              },
                              builder: (context, state) {
                                if (state is! SavingTodo) {
                                  return const SizedBox.shrink();
                                }
                                String message;
                                switch (state.processingState) {
                                  case ProcessingState.processing:
                                    message = 'Saving';
                                  case ProcessingState.success:
                                    message = 'Saved';
                                  case ProcessingState.failure:
                                    message = 'Error Saving';
                                }
                                return Text(
                                  message,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        color: Colors.grey.shade600,
                                      ),
                                );
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        Expanded(
                          child: EditableText(
                            controller: descriptionEditingController!,
                            focusNode: descriptionEditingFocusNode!,
                            maxLines: null,
                            autofocus: true,
                            style: Theme.of(context).textTheme.bodyMedium!,
                            cursorColor: Theme.of(context).colorScheme.primary,
                            backgroundCursorColor:
                                Theme.of(context).colorScheme.secondary,
                            onChanged: (text) {
                              context.read<ViewTodoBloc>().add(
                                    TodoDataChanged(
                                      todo: state.todo!.copyWith(
                                        description: text,
                                      ),
                                    ),
                                  );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
