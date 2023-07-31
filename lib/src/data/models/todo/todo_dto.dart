import 'package:realm/realm.dart';

part 'todo_dto.g.dart';

extension ParseTodoDTOFromAndToJson on TodoDTO {
  TodoDTO fromJson(Map<String, dynamic> json) {
    return TodoDTO(
      id,
      json['color'] as String,
      json['time'] as String,
      json['priority'] as String,
      json['description'] as String,
      json['title'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'color': color,
      'time': time,
      'priority': priority,
      'description': description,
      'title': title,
    };
  }
}

@RealmModel()
class _TodoDTO {
  @PrimaryKey()
  late ObjectId id;
  late final String color;
  late final String time;
  late final String priority;
  late final String description;
  late final String title;

  @override
  String toString() {
    return '_TodoDTO{id: $id, color: $color, time: $time, priority: $priority,'
        ' description: $description, title: $title}';
  }
}
