import 'package:realm/realm.dart';

class Todo {
  Todo({
    required this.id,
    required this.color,
    required this.time,
    required this.priority,
    required this.description,
    required this.title,
    required this.synced,
    required this.completed,
  });

  final ObjectId id;
  final String color;
  final String time;
  final String priority;
  final String description;
  final String title;
  final bool synced;
  final bool completed;

  @override
  String toString() {
    return 'Todo{id: $id, color: $color, time: $time, priority: $priority,'
        ' description: $description, title: $title, synced: $synced,'
        ' completed: $completed}';
  }
}
