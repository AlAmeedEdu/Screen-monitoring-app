abstract final class Formatters {
  static String emptyDash(String? value) =>
      value == null || value.isEmpty ? '-' : value;
}
