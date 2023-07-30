import 'package:intl/intl.dart';

extension DateHelpers on DateTime {
  bool isToday() {
    final now = DateTime.now();
    return now.day == day && now.month == month && now.year == year;
  }

  bool isBehindOfToday() {
    final now = DateTime.now();
    return now.day > day && now.month == month && now.year == year;
  }

  bool isAheadOfToday() {
    final now = DateTime.now();
    return now.day < day && now.month == month && now.year == year;
  }

  bool isYesterday() {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return yesterday.day == day &&
        yesterday.month == month &&
        yesterday.year == year;
  }

  String format() {
    final digit = day % 10;
    final suffix = (digit > 0 && digit < 4 && (day < 11 || day > 13))
        ? ['st', 'nd', 'rd'][digit - 1]
        : 'th';

    final timeFormat = DateFormat('h:mma').format(this).toLowerCase();

    final dateFormat =
        isToday() ? 'Today' : DateFormat('E MMM d').format(this) + suffix;

    return '$dateFormat, $timeFormat';
  }
}
