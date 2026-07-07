import 'package:get/get.dart';

import '../core/controllers/theme_controller.dart';

/// يجمع قيما أو عناصر عامة تستخدم في أكثر من مكان داخل التطبيق.
class AppBindings extends Bindings {
  /// يسجل الـ controllers أو الخدمات التي تحتاجها الصفحة قبل عرضها.
  @override
  void dependencies() {
    Get.put<ThemeController>(ThemeController(), permanent: true);
  }
}
