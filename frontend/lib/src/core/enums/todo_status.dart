enum TodoStatus {
  today,
  upcoming,
  completed,
}

extension ParseIntToTodoStatus on int {
  TodoStatus todoStatus() {
    switch (this) {
      case 0:
        return TodoStatus.today;
      case 1:
        return TodoStatus.upcoming;
      case 2:
        return TodoStatus.completed;
      default:
        return TodoStatus.today;
    }
  }
}
