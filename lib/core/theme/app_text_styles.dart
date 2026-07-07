import 'package:flutter/material.dart';

/// يجمع قيما أو عناصر عامة تستخدم في أكثر من مكان داخل التطبيق.
abstract final class AppTextStyles {
  static const title =
      TextStyle(fontSize: 20, fontWeight: FontWeight.w700, height: 1.2);
  static const subtitle =
      TextStyle(fontSize: 16, fontWeight: FontWeight.w600, height: 1.35);
  static const body =
      TextStyle(fontSize: 14, fontWeight: FontWeight.w400, height: 1.45);
  static const caption =
      TextStyle(fontSize: 12, fontWeight: FontWeight.w400, height: 1.35);
  static const tiny =
      TextStyle(fontSize: 10, fontWeight: FontWeight.w400, height: 1.2);
}
