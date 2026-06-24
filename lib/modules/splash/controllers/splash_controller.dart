import 'package:get/get.dart';

import '../../../app/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    Future<void>.delayed(const Duration(milliseconds: 700), () {
      Get.offAllNamed(AppRoutes.login);
    });
  }
}
