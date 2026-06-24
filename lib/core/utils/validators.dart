abstract final class Validators {
  static bool isRequired(String? value) =>
      value != null && value.trim().isNotEmpty;
}
