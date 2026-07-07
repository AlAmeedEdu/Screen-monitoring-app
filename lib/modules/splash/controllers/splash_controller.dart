import 'package:get/get.dart';

import '../../../app/app_routes.dart';

/// يدير حالة هذه الشاشة وينفذ أوامرها بعيدا عن كود الواجهة.
class SplashController extends GetxController {
  /// يعمل بعد جاهزية الشاشة ويستخدم للانتقال أو تنفيذ إجراء بعد الظهور.
  @override
  void onReady() {
    super.onReady();
    Future<void>.delayed(const Duration(milliseconds: 1800), () {
      Get.offAllNamed(AppRoutes.login);
    });
  }
}
