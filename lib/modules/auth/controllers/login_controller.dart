import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/app_routes.dart';

/// يدير حالة هذه الشاشة وينفذ أوامرها بعيدا عن كود الواجهة.
class LoginController extends GetxController {
  final usernameController = TextEditingController(text: 'mohamed');
  final passwordController = TextEditingController(text: '123456');
  final obscurePassword = true.obs;

  /// يعكس حالة اختيار أو إعداد داخل الشاشة.
  void togglePasswordVisibility() {
    obscurePassword.toggle();
  }

  /// ينفذ انتقال تسجيل الدخول إلى الواجهة الرئيسية للتطبيق.
  void login() {
    Get.offAllNamed(AppRoutes.mainLayout);
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
