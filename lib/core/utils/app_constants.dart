class AppConstants {
  static String capitalize(String input) {
    if (input.isEmpty) return input;
    return input.replaceFirst(input[0], input[0].toUpperCase());
  }
}
