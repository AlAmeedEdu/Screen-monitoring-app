import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/app_routes.dart';

class LoginController extends GetxController {
  final usernameController = TextEditingController(text: 'mohamed');
  final passwordController = TextEditingController(text: '123456');
  final obscurePassword = true.obs;

  void togglePasswordVisibility() {
    obscurePassword.toggle();
  }

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
