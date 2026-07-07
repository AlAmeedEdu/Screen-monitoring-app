/// يمثل Formatters كجزء من بنية المشروع ويجمع المسؤولية الخاصة به في مكان واحد.
abstract final class Formatters {
  static String emptyDash(String? value) =>
      value == null || value.isEmpty ? '-' : value;
}
