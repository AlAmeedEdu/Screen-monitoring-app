import 'package:flutter/material.dart';

import 'app_palette.dart';

/// يجمع قيما أو عناصر عامة تستخدم في أكثر من مكان داخل التطبيق.
abstract final class AppShadows {
  static const card = [
    BoxShadow(color: Color(0x140F363B), blurRadius: 16, offset: Offset(0, 8)),
  ];

  static const soft = [
    BoxShadow(color: Color(0xFFECF6F8), blurRadius: 8, offset: Offset(0, 4)),
  ];

  static List<BoxShadow> cardFor(BuildContext context) {
    if (context.isAppDarkMode) {
      return [
        BoxShadow(
          color: context.colors.shadow,
          blurRadius: 24,
          offset: const Offset(0, 12),
        ),
      ];
    }

    return card;
  }

  static List<BoxShadow> softFor(BuildContext context) {
    if (context.isAppDarkMode) {
      return [
        BoxShadow(
          color: Colors.black.withValues(alpha: .34),
          blurRadius: 20,
          offset: const Offset(0, 10),
        ),
      ];
    }

    return soft;
  }
}
