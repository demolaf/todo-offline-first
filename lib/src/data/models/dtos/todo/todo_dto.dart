import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:realm/realm.dart';
import 'package:todo_bloc/src/data/models/domains/todo.dart';

part 'todo_dto.g.dart';

extension TodoDTOJsonParser on TodoDTO {
  Todo toPlainObject() {
    return Todo(
      id: id.hexString,
      color: color,
      time: time,
      priority: priority,
      description: description,
      title: title,
      synced: synced,
      completed: completed,
    );
  }

  static TodoDTO _toRealmObject(_TodoDTO todo) {
    return TodoDTO(
      todo.id,
      todo.color,
      todo.time,
      todo.priority,
      todo.description,
      todo.title,
      todo.synced,
      todo.completed,
    );
  }

  static TodoDTO fromJson(Map<String, dynamic> json) =>
      _toRealmObject(_$TodoDTOFromJson(json));

  Map<String, dynamic> toJson() => _$TodoDTOToJson(this);

  TodoDTO copyWith({
    String? color,
    String? time,
    String? priority,
    String? description,
    String? title,
    bool? synced,
    bool? completed,
  }) {
    return TodoDTO(
      id,
      color ?? this.color,
      time ?? this.time,
      priority ?? this.priority,
      description ?? this.description,
      title ?? this.title,
      synced ?? this.synced,
      completed ?? this.completed,
    );
  }
}

@RealmModel()
@JsonSerializable()
@ObjectIdConverter()
class _TodoDTO {
  @PrimaryKey()
  late ObjectId id;
  late final String color;
  late final String time;
  late final String priority;
  late final String description;
  late final String title;
  late bool synced;
  late bool completed;

  @override
  String toString() {
    return '_TodoDTO{id: $id, color: $color, time: $time, '
        'priority: $priority, description: $description, title: '
        '$title, synced: $synced, completed: $completed}';
  }
}

class ObjectIdConverter implements JsonConverter<ObjectId, String> {
  const ObjectIdConverter();

  @override
  ObjectId fromJson(String json) {
    return ObjectId.fromHexString(json);
  }

  @override
  String toJson(ObjectId id) => id.hexString;
}
