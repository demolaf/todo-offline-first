extension StringHelpersX on String {
  /// Capitalize the first letter in a string.
  String get capitalize {
    return (length > 1) ? this[0].toUpperCase() + substring(1) : toUpperCase();
  }
}
