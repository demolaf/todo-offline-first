import 'dart:math';

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/src/core/enums/enums.dart';
import 'package:todo_bloc/src/data/models/domains/todo.dart';
import 'package:todo_bloc/src/data/repositories/todo/todo_repository.dart';
import 'package:todo_bloc/src/data/repositories/todo_sync/todo_sync_repository.dart';
import 'package:todo_bloc/src/modules/create_todo/bloc/create_todo_bloc.dart';

enum TodoOperationType {
  create,
  edit,
}

class CreateTodoView extends StatefulWidget {
  const CreateTodoView({
    required this.todoOperationType,
    this.todo,
    super.key,
  });

  static Route<CreateTodoView> route({
    required TodoOperationType todoOperationType,
    Todo? todo,
  }) {
    return MaterialPageRoute(
      builder: (context) {
        return BlocProvider(
          create: (context) => CreateTodoBloc(
            todoSyncRepository: context.read<TodoSyncRepository>(),
            todoRepository: context.read<TodoRepository>(),
          )..add(
              CreateTodoInitializationRequested(
                todoOperationType: todoOperationType,
                id: todo?.id,
              ),
            ),
          child:
              CreateTodoView(todoOperationType: todoOperationType, todo: todo),
        );
      },
    );
  }

  final TodoOperationType todoOperationType;
  final Todo? todo;

  @override
  State<CreateTodoView> createState() => _CreateTodoViewState();
}

class _CreateTodoViewState extends State<CreateTodoView> {
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
                .read<CreateTodoBloc>()
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
                  context.read<CreateTodoBloc>().add(const DeleteTodo());
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
          child: BlocBuilder<CreateTodoBloc, CreateTodoState>(
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
                                context.read<CreateTodoBloc>().add(
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
                            BlocSelector<CreateTodoBloc, CreateTodoState,
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
                              context.read<CreateTodoBloc>().add(
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

class ExtrasButton extends StatefulWidget {
  const ExtrasButton({
    super.key,
  });

  @override
  State<ExtrasButton> createState() => _ExtrasButtonState();
}

class _ExtrasButtonState extends State<ExtrasButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _rotationAnimationController;
  late Animation<double> _rotationAnimation;

  LayerLink layerLink = LayerLink();
  OverlayEntry? entry;

  bool extrasMenuVisible = false;

  @override
  void initState() {
    super.initState();

    _rotationAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _rotationAnimation = Tween<double>(begin: 0, end: 45 / 360).animate(
      CurvedAnimation(
        parent: _rotationAnimationController,
        curve: Curves.easeInOutCubic,
      ),
    );
  }

  @override
  void dispose() {
    hideExtrasMenu();
    _rotationAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: layerLink,
      child: SizedBox(
        width: 48,
        height: 48,
        child: IconButton.filled(
          iconSize: 20,
          style: ButtonStyle(
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          onPressed: () {
            if (!extrasMenuVisible) {
              _rotationAnimationController.forward();
              showExtrasMenu(context.read<CreateTodoBloc>());
            } else {
              _rotationAnimationController.reverse();
              hideExtrasMenu();
            }

            setState(() {
              extrasMenuVisible = !extrasMenuVisible;
            });
          },
          icon: RotationTransition(
            turns: _rotationAnimation,
            child: const FittedBox(
              child: Icon(
                Icons.add,
                size: 24,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showExtrasMenu(CreateTodoBloc bloc) {
    final overlay = Overlay.of(context);
    final renderBox = context.findRenderObject()! as RenderBox;
    final size = renderBox.size;

    entry = OverlayEntry(
      builder: (context) => Positioned(
        width: size.width,
        child: CompositedTransformFollower(
          link: layerLink,
          showWhenUnlinked: false,
          offset: Offset(0, size.height + 16),
          child: BlocProvider.value(
            value: bloc,
            child: const ExtrasMenu(),
          ),
        ),
      ),
    );

    overlay.insert(entry!);
  }

  void hideExtrasMenu() {
    entry?.remove();
    entry = null;
  }
}

class ExtrasMenu extends StatefulWidget {
  const ExtrasMenu({
    super.key,
  });

  @override
  State<ExtrasMenu> createState() => _ExtrasMenuState();
}

class _ExtrasMenuState extends State<ExtrasMenu>
    with SingleTickerProviderStateMixin {
  late AnimationController _fadeAnimationController;
  late Animation<double> _fadeAnimation;

  LayerLink layerLink = LayerLink();
  OverlayEntry? entry;

  DateTime? selectedDateTime;
  Color? selectedColor;

  int selectedPriorityIndex = 0;
  TodoPriority? selectedPriority;

  @override
  void initState() {
    super.initState();

    final todo = context.read<CreateTodoBloc>().getTodo();

    if (todo != null) {
      selectedDateTime = DateTime.tryParse(todo.time ?? '');
      selectedPriority = todo.priority?.toTodoPriority();
    }

    _fadeAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    )..forward();

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _fadeAnimationController,
        curve: Curves.easeIn,
      ),
    );
  }

  @override
  void dispose() {
    _fadeAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Container(
        width: 56,
        padding: const EdgeInsets.symmetric(vertical: 24),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(12),
        ),
        child: BlocBuilder<CreateTodoBloc, CreateTodoState>(
          builder: (context, state) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    final random = Random();

                    final red = random.nextInt(256);
                    final green = random.nextInt(256);
                    final blue = random.nextInt(256);

                    setState(() {
                      selectedColor = Color.fromARGB(255, red, green, blue);
                    });

                    debugPrint(selectedColor?.value.toString());
                    context.read<CreateTodoBloc>().add(
                          TodoDataChanged(
                            todo: state.todo!.copyWith(
                              color: selectedColor.toString(),
                            ),
                          ),
                        );
                  },
                  child: Container(
                    width: 24,
                    height: 24,
                    decoration: ShapeDecoration(
                      color: selectedColor ?? Colors.white,
                      shape: const CircleBorder(),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                GestureDetector(
                  onTap: () {
                    _showDatePicker(context, state.todo!);
                  },
                  child: const Icon(
                    Icons.access_time_rounded,
                    semanticLabel: 'Deadline',
                  ),
                ),
                const SizedBox(height: 24),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedPriorityIndex = (selectedPriorityIndex + 1) %
                          TodoPriority.values.length;

                      selectedPriority =
                          TodoPriority.values[selectedPriorityIndex];
                    });

                    context.read<CreateTodoBloc>().add(
                          TodoDataChanged(
                            todo: state.todo!.copyWith(
                              priority: selectedPriority!.toShortString(),
                            ),
                          ),
                        );
                  },
                  child: Icon(
                    Icons.warning_rounded,
                    color: selectedPriority?.toColor() ??
                        TodoPriority.normal.toColor(),
                    semanticLabel: 'Priority',
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _showDatePicker(BuildContext context, Todo todo) {
    showModalBottomSheet<Widget>(
      context: context,
      builder: (_) {
        return SizedBox(
          height: 300,
          child: CupertinoDatePicker(
            initialDateTime: DateTime.now(),
            onDateTimeChanged: (val) {
              setState(() {
                selectedDateTime = val;
              });

              context.read<CreateTodoBloc>().add(
                    TodoDataChanged(
                      todo: todo.copyWith(
                        time: selectedDateTime?.toIso8601String(),
                      ),
                    ),
                  );
            },
          ),
        );
      },
    );
  }
}
