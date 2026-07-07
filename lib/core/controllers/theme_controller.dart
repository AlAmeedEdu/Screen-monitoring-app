import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// يدير حالة هذه الشاشة وينفذ أوامرها بعيدا عن كود الواجهة.
class ThemeController extends GetxController {
  final isDarkMode = false.obs;

  /// يغير قيمة في الحالة حتى تتحدث الواجهة المرتبطة بها.
  void setDarkMode(bool value) {
    isDarkMode.value = value;
    Get.changeThemeMode(value ? ThemeMode.dark : ThemeMode.light);
  }

  /// يعكس حالة اختيار أو إعداد داخل الشاشة.
  void toggle() => setDarkMode(!isDarkMode.value);
}
