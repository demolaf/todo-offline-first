import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_bloc/src/core/enums.dart';
import 'package:todo_bloc/src/core/extensions/date_time_helpers.dart';

class CreateTodoView extends StatefulWidget {
  const CreateTodoView({required this.todoActionType, super.key});

  static Route<CreateTodoView> route({required TodoActionType todoActionType}) {
    return MaterialPageRoute(
      builder: (context) {
        return CreateTodoView(todoActionType: todoActionType);
      },
    );
  }

  final TodoActionType todoActionType;

  @override
  State<CreateTodoView> createState() => _CreateTodoViewState();
}

class _CreateTodoViewState extends State<CreateTodoView> {
  TextEditingController? editingController;
  FocusNode? editingFocusNode;
  DateTime? selectedDateTime;

  @override
  void initState() {
    super.initState();
    editingController = TextEditingController();
    editingFocusNode = FocusNode();
  }

  @override
  void dispose() {
    editingController?.dispose();
    editingFocusNode?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // TODO(demolaf): replace with enums
        title: Text('${widget.todoActionType.name.capitalize} Todo'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 24),
            child: Row(
              children: [
                Icon(
                  Icons.delete,
                ),
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Choose a color or use default priority color'),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      decoration: const ShapeDecoration(
                        color: Colors.red,
                        shape: CircleBorder(),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Container(
                      width: 24,
                      height: 24,
                      decoration: const ShapeDecoration(
                        color: Colors.green,
                        shape: CircleBorder(),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Container(
                      width: 24,
                      height: 24,
                      decoration: const ShapeDecoration(
                        color: Colors.blue,
                        shape: CircleBorder(),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Container(
                      width: 24,
                      height: 24,
                      decoration: const ShapeDecoration(
                        color: Colors.yellow,
                        shape: CircleBorder(),
                      ),
                    ),
                    const SizedBox(width: 16),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 24,
                        height: 24,
                        decoration: const ShapeDecoration(
                          color: Colors.grey,
                          shape: CircleBorder(),
                        ),
                        child: const Icon(
                          Icons.add,
                          size: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Divider(),
            const SizedBox(height: 24),
            GestureDetector(
              onTap: () {
                _showDatePicker(context);
              },
              child: Text(
                selectedDateTime?.format() ?? 'Choose a time',
              ),
            ),
            const SizedBox(height: 24),
            const Divider(),
            const SizedBox(height: 24),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Priority'),
                const SizedBox(height: 16),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    ...TodoPriority.values.map(
                      (priority) => Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: Chip(
                          label: Text(
                            priority.name.capitalize,
                          ),
                          backgroundColor: priority.toColor(),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 24,
                        height: 24,
                        decoration: const ShapeDecoration(
                          color: Colors.grey,
                          shape: CircleBorder(),
                        ),
                        child: const Icon(
                          Icons.add,
                          size: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Divider(),
            const SizedBox(height: 24),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Description'),
                  const SizedBox(height: 24),
                  EditableText(
                    autofocus: true,
                    maxLines: null,
                    controller: editingController!,
                    focusNode: editingFocusNode!,
                    style: Theme.of(context).textTheme.bodyMedium!,
                    cursorColor: Theme.of(context).colorScheme.primary,
                    backgroundCursorColor:
                        Theme.of(context).colorScheme.secondary,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDatePicker(BuildContext context) {
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
            },
          ),
        );
      },
    );
  }
}
