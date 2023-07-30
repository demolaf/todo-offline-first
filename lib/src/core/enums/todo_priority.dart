import 'package:flutter/material.dart';

enum TodoPriority {
  high,
  medium,
  low,
  normal,
}

extension ParseTodoPriorityToColor on TodoPriority {
  Color toColor() {
    switch (this) {
      case TodoPriority.high:
        return Colors.red;
      case TodoPriority.medium:
        return Colors.yellow;
      case TodoPriority.low:
        return Colors.green;
      case TodoPriority.normal:
        return Colors.grey;
    }
  }
}
