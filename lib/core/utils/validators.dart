/// يمثل Validators كجزء من بنية المشروع ويجمع المسؤولية الخاصة به في مكان واحد.
abstract final class Validators {
  static bool isRequired(String? value) =>
      value != null && value.trim().isNotEmpty;
}
