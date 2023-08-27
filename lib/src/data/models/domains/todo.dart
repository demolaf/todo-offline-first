import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo.freezed.dart';

part 'todo.g.dart';

@freezed
class Todo with _$Todo {
  const factory Todo({
    required String id,
    required String title,
    required String description,
    String? color,
    String? time,
    String? priority,
    bool? synced,
    bool? completed,
  }) = _Todo;

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);
}
