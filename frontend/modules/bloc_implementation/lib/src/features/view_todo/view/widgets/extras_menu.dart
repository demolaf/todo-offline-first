import 'dart:math';

import 'package:apis/apis.dart';
import 'package:bloc_implementation/src/features/view_todo/bloc/view_todo_bloc.dart';
import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

    final todo = context.read<ViewTodoBloc>().getTodo();

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
        child: BlocBuilder<ViewTodoBloc, ViewTodoState>(
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
                    context.read<ViewTodoBloc>().add(
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

                    context.read<ViewTodoBloc>().add(
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

              context.read<ViewTodoBloc>().add(
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
