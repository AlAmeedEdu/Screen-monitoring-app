import 'package:flutter/material.dart';

/// يجمع قيما أو عناصر عامة تستخدم في أكثر من مكان داخل التطبيق.
class AppPalette extends ThemeExtension<AppPalette> {
  const AppPalette({
    required this.canvas,
    required this.surface,
    required this.surfaceSoft,
    required this.card,
    required this.primaryText,
    required this.secondaryText,
    required this.hintText,
    required this.border,
    required this.icon,
    required this.accent,
    required this.accentSoft,
    required this.success,
    required this.successSoft,
    required this.danger,
    required this.dangerSoft,
    required this.warning,
    required this.warningSoft,
    required this.inactive,
    required this.shadow,
  });

  final Color canvas;
  final Color surface;
  final Color surfaceSoft;
  final Color card;
  final Color primaryText;
  final Color secondaryText;
  final Color hintText;
  final Color border;
  final Color icon;
  final Color accent;
  final Color accentSoft;
  final Color success;
  final Color successSoft;
  final Color danger;
  final Color dangerSoft;
  final Color warning;
  final Color warningSoft;
  final Color inactive;
  final Color shadow;

  static const light = AppPalette(
    canvas: Color(0xFFF3F6F6),
    surface: Color(0xFFFFFFFF),
    surfaceSoft: Color(0xFFF6FBFB),
    card: Color(0xFFFFFFFF),
    primaryText: Color(0xFF090909),
    secondaryText: Color(0xFF626262),
    hintText: Color(0xFFC4D0D2),
    border: Color(0xFFEAF1F2),
    icon: Color(0xFF0F363B),
    accent: Color(0xFF42A7B5),
    accentSoft: Color(0xFFECF6F8),
    success: Color(0xFF16A34A),
    successSoft: Color(0xFFDDFBE9),
    danger: Color(0xFFE94040),
    dangerSoft: Color(0xFFFEF6F6),
    warning: Color(0xFFF2A400),
    warningSoft: Color(0xFFFFFAEB),
    inactive: Color(0xFF8D9A9D),
    shadow: Color(0x180F363B),
  );

  static const dark = AppPalette(
    canvas: Color(0xFF071113),
    surface: Color(0xFF101C1F),
    surfaceSoft: Color(0xFF162529),
    card: Color(0xFF132225),
    primaryText: Color(0xFFF4FBFC),
    secondaryText: Color(0xFFB5C8CB),
    hintText: Color(0xFF70898E),
    border: Color(0xFF263B40),
    icon: Color(0xFFD9F3F5),
    accent: Color(0xFF4DB6C2),
    accentSoft: Color(0xFF123036),
    success: Color(0xFF4ADE80),
    successSoft: Color(0xFF0D3020),
    danger: Color(0xFFFF5A62),
    dangerSoft: Color(0xFF351719),
    warning: Color(0xFFFFBF3F),
    warningSoft: Color(0xFF332817),
    inactive: Color(0xFF89A1A6),
    shadow: Color(0x66000000),
  );

  /// ينشئ نسخة جديدة مع تعديل القيم المطلوبة فقط.
  @override
  AppPalette copyWith({
    Color? canvas,
    Color? surface,
    Color? surfaceSoft,
    Color? card,
    Color? primaryText,
    Color? secondaryText,
    Color? hintText,
    Color? border,
    Color? icon,
    Color? accent,
    Color? accentSoft,
    Color? success,
    Color? successSoft,
    Color? danger,
    Color? dangerSoft,
    Color? warning,
    Color? warningSoft,
    Color? inactive,
    Color? shadow,
  }) {
    return AppPalette(
      canvas: canvas ?? this.canvas,
      surface: surface ?? this.surface,
      surfaceSoft: surfaceSoft ?? this.surfaceSoft,
      card: card ?? this.card,
      primaryText: primaryText ?? this.primaryText,
      secondaryText: secondaryText ?? this.secondaryText,
      hintText: hintText ?? this.hintText,
      border: border ?? this.border,
      icon: icon ?? this.icon,
      accent: accent ?? this.accent,
      accentSoft: accentSoft ?? this.accentSoft,
      success: success ?? this.success,
      successSoft: successSoft ?? this.successSoft,
      danger: danger ?? this.danger,
      dangerSoft: dangerSoft ?? this.dangerSoft,
      warning: warning ?? this.warning,
      warningSoft: warningSoft ?? this.warningSoft,
      inactive: inactive ?? this.inactive,
      shadow: shadow ?? this.shadow,
    );
  }

  /// يمزج بين قيمتين من الثيم أثناء الانتقال أو التحريك.
  @override
  AppPalette lerp(ThemeExtension<AppPalette>? other, double t) {
    if (other is! AppPalette) return this;

    return AppPalette(
      canvas: Color.lerp(canvas, other.canvas, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      surfaceSoft: Color.lerp(surfaceSoft, other.surfaceSoft, t)!,
      card: Color.lerp(card, other.card, t)!,
      primaryText: Color.lerp(primaryText, other.primaryText, t)!,
      secondaryText: Color.lerp(secondaryText, other.secondaryText, t)!,
      hintText: Color.lerp(hintText, other.hintText, t)!,
      border: Color.lerp(border, other.border, t)!,
      icon: Color.lerp(icon, other.icon, t)!,
      accent: Color.lerp(accent, other.accent, t)!,
      accentSoft: Color.lerp(accentSoft, other.accentSoft, t)!,
      success: Color.lerp(success, other.success, t)!,
      successSoft: Color.lerp(successSoft, other.successSoft, t)!,
      danger: Color.lerp(danger, other.danger, t)!,
      dangerSoft: Color.lerp(dangerSoft, other.dangerSoft, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      warningSoft: Color.lerp(warningSoft, other.warningSoft, t)!,
      inactive: Color.lerp(inactive, other.inactive, t)!,
      shadow: Color.lerp(shadow, other.shadow, t)!,
    );
  }
}

/// يضيف خصائص مساعدة على AppPaletteContext لتسهيل الوصول لقيم مشتركة داخل الواجهة.
extension AppPaletteContext on BuildContext {
  /// يوفر قيمة colors المحسوبة لاستخدامها داخل الواجهة أو المنطق.
  AppPalette get colors => Theme.of(this).extension<AppPalette>()!;

  /// يرجع حالة منطقية تستخدمها الواجهة لاختيار الشكل أو السلوك المناسب.
  bool get isAppDarkMode => Theme.of(this).brightness == Brightness.dark;
}
