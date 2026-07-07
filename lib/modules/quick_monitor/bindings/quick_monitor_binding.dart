import 'package:get/get.dart';

import '../controllers/quick_monitor_controller.dart';

/// يسجل الاعتمادات والـ controllers اللازمة قبل فتح هذه الصفحة في GetX.
class QuickMonitorBinding extends Bindings {
  /// يسجل الـ controllers أو الخدمات التي تحتاجها الصفحة قبل عرضها.
  @override
  void dependencies() {
    Get.lazyPut<QuickMonitorController>(() => QuickMonitorController());
  }
}
