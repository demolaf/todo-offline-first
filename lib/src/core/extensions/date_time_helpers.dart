import 'package:intl/intl.dart';
import 'package:moment_dart/moment_dart.dart';

extension DateHelpers on DateTime {
  bool isToday() {
    return Moment.now().isAtSameDayAs(this);
  }

  bool isYesterday() {
    return Moment.now().isBefore(this);
  }

  bool isAheadOfToday() {
    return Moment.now().isAfter(this);
  }

  String formatDateAndTime() {
    final digit = day % 10;
    final suffix = (digit > 0 && digit < 4 && (day < 11 || day > 13))
        ? ['st', 'nd', 'rd'][digit - 1]
        : 'th';

    final timeFormat = DateFormat('h:mma').format(this).toLowerCase();

    final dateFormat =
        isToday() ? 'Today' : DateFormat('E MMM d').format(this) + suffix;

    return '$dateFormat, $timeFormat';
  }

  String formatDateOnly() {
    final digit = day % 10;
    final suffix = (digit > 0 && digit < 4 && (day < 11 || day > 13))
        ? ['st', 'nd', 'rd'][digit - 1]
        : 'th';

    final dateFormat =
        isToday() ? 'Today' : DateFormat('E MMM d').format(this) + suffix;

    return dateFormat;
  }

  String formatTimeOnly() {
    final timeFormat = DateFormat('h:mma').format(this).toLowerCase();

    return timeFormat;
  }
}
