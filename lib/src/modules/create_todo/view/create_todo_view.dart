import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/src/core/enums/enums.dart';
import 'package:todo_bloc/src/data/repositories/todo/todo_repository.dart';
import 'package:todo_bloc/src/modules/connection_checker/bloc/connection_checker_bloc.dart';
import 'package:todo_bloc/src/modules/create_todo/bloc/create_todo_bloc.dart';

class CreateTodoView extends StatefulWidget {
  const CreateTodoView({required this.todoActionType, super.key});

  static Route<CreateTodoView> route({required TodoActionType todoActionType}) {
    return MaterialPageRoute(
      builder: (context) {
        return BlocProvider(
          create: (context) => CreateTodoBloc(
            todoRepository: context.read<TodoRepository>(),
          ),
          child: CreateTodoView(todoActionType: todoActionType),
        );
      },
    );
  }

  final TodoActionType todoActionType;

  @override
  State<CreateTodoView> createState() => _CreateTodoViewState();
}

class _CreateTodoViewState extends State<CreateTodoView> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController? titleEditingController;
  TextEditingController? descriptionEditingController;
  FocusNode? titleEditingFocusNode;
  FocusNode? descriptionEditingFocusNode;
  DateTime? selectedDateTime;
  bool connected = false;

  @override
  void initState() {
    super.initState();
    titleEditingController = TextEditingController();
    titleEditingFocusNode = FocusNode();
    descriptionEditingController = TextEditingController();
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
    return BlocListener<ConnectionCheckerBloc, ConnectionCheckerState>(
      listener: (context, state) {
        if (state is ConnectionCheckerStateReady) {
          connected = state.connected;
        }
      },
      child: Scaffold(
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
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topRight,
            children: [
              Form(
                key: _formKey,
                onChanged: () {
                  context.read<CreateTodoBloc>().add(
                        CreateTodo(
                          title: titleEditingController?.text ?? '',
                          description: descriptionEditingController?.text ?? '',
                          color: Colors.purple.hex,
                          priority: TodoPriority.high,
                          time: DateTime.now(),
                        ),
                      );
                },
                child: Column(
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
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 24),
                        SizedBox(
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
                            onPressed: () {},
                            icon: const Icon(
                              Icons.add,
                            ),
                          ),
                        ),
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
                                  CreatingTodo?>(
                                selector: (state) {
                                  if (state is CreatingTodo) {
                                    return state;
                                  }

                                  return null;
                                },
                                builder: (context, state) {
                                  if (state is! CreatingTodo) {
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
                              cursorColor:
                                  Theme.of(context).colorScheme.primary,
                              backgroundCursorColor:
                                  Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Container(
              //   width: 56,
              //   decoration: BoxDecoration(
              //     color: Theme.of(context).colorScheme.primaryContainer,
              //     borderRadius: BorderRadius.circular(12),
              //   ),
              //   child: Column(
              //     mainAxisSize: MainAxisSize.min,
              //     children: [
              //       Container(
              //         width: 24,
              //         height: 24,
              //         decoration: const ShapeDecoration(
              //           color: Colors.blue,
              //           shape: CircleBorder(),
              //         ),
              //       ),
              //       const SizedBox(height: 24),
              //       const Icon(
              //         Icons.access_time_rounded,
              //       ),
              //       const SizedBox(height: 24),
              //       const Icon(
              //         Icons.warning_rounded,
              //       ),
              //       const SizedBox(height: 24),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  // void _showDatePicker(BuildContext context) {
  //   showModalBottomSheet<Widget>(
  //     context: context,
  //     builder: (_) {
  //       return SizedBox(
  //         height: 300,
  //         child: CupertinoDatePicker(
  //           initialDateTime: DateTime.now(),
  //           onDateTimeChanged: (val) {
  //             setState(() {
  //               selectedDateTime = val;
  //             });
  //           },
  //         ),
  //       );
  //     },
  //   );
  // }
}

// Column(
//   crossAxisAlignment: CrossAxisAlignment.start,
//   children: [
//     const Text('Choose a color or use default priority color'),
//     const SizedBox(height: 16),
//     Row(
//       children: [
//         Container(
//           width: 24,
//           height: 24,
//           decoration: const ShapeDecoration(
//             color: Colors.red,
//             shape: CircleBorder(),
//           ),
//         ),
//         const SizedBox(width: 16),
//         Container(
//           width: 24,
//           height: 24,
//           decoration: const ShapeDecoration(
//             color: Colors.green,
//             shape: CircleBorder(),
//           ),
//         ),
//         const SizedBox(width: 16),
//         Container(
//           width: 24,
//           height: 24,
//           decoration: const ShapeDecoration(
//             color: Colors.blue,
//             shape: CircleBorder(),
//           ),
//         ),
//         const SizedBox(width: 16),
//         Container(
//           width: 24,
//           height: 24,
//           decoration: const ShapeDecoration(
//             color: Colors.yellow,
//             shape: CircleBorder(),
//           ),
//         ),
//         const SizedBox(width: 16),
//         GestureDetector(
//           onTap: () {},
//           child: Container(
//             width: 24,
//             height: 24,
//             decoration: const ShapeDecoration(
//               color: Colors.grey,
//               shape: CircleBorder(),
//             ),
//             child: const Icon(
//               Icons.add,
//               size: 12,
//             ),
//           ),
//         ),
//       ],
//     ),
//   ],
// ),
// const SizedBox(height: 24),
// const Divider(),
// const SizedBox(height: 24),
// GestureDetector(
//   onTap: () {
//     _showDatePicker(context);
//   },
//   child: Text(
//     selectedDateTime?.formatDateAndTime() ?? 'Choose a time',
//   ),
// ),
// const SizedBox(height: 24),
// const Divider(),
// const SizedBox(height: 24),
// Column(
//   crossAxisAlignment: CrossAxisAlignment.start,
//   children: [
//     const Text('Priority'),
//     const SizedBox(height: 16),
//     Wrap(
//       crossAxisAlignment: WrapCrossAlignment.center,
//       children: [
//         ...TodoPriority.values.map(
//           (priority) => Padding(
//             padding: const EdgeInsets.only(right: 12),
//             child: Chip(
//               label: Text(
//                 priority.name.capitalize,
//               ),
//               backgroundColor: priority.toColor(),
//             ),
//           ),
//         ),
//         GestureDetector(
//           onTap: () {},
//           child: Container(
//             width: 24,
//             height: 24,
//             decoration: const ShapeDecoration(
//               color: Colors.grey,
//               shape: CircleBorder(),
//             ),
//             child: const Icon(
//               Icons.add,
//               size: 12,
//             ),
//           ),
//         ),
//       ],
//     ),
//   ],
// ),
// const SizedBox(height: 24),
// const Divider(),
// const SizedBox(height: 24),
// const SizedBox(height: 24),
// const Divider(),
