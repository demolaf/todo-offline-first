import 'package:flutter/material.dart';

enum TodoPriority {
  high,
  medium,
  normal,
  low,
}

extension ParseTodoPriorityToColor on TodoPriority {
  Color toColor() {
    switch (this) {
      case TodoPriority.high:
        return Colors.red;
      case TodoPriority.medium:
        return Colors.yellow;
      case TodoPriority.normal:
        return Colors.green;
      case TodoPriority.low:
        return Colors.blue;
    }
  }

  int toIndex() {
    switch (this) {
      case TodoPriority.high:
        return 3;
      case TodoPriority.medium:
        return 2;
      case TodoPriority.normal:
        return 1;
      case TodoPriority.low:
        return 0;
    }
  }

  String toShortString() {
    switch (this) {
      case TodoPriority.high:
        return 'High';
      case TodoPriority.medium:
        return 'Medium';
      case TodoPriority.normal:
        return 'Normal';
      case TodoPriority.low:
        return 'Low';
    }
  }
}

extension ParseStringToTodoPriority on String {
  TodoPriority toTodoPriority() {
    switch (this) {
      case 'High':
        return TodoPriority.high;
      case 'Medium':
        return TodoPriority.medium;
      case 'Normal':
        return TodoPriority.normal;
      case 'Low':
        return TodoPriority.low;
      default:
        return TodoPriority.normal;
    }
  }
}
