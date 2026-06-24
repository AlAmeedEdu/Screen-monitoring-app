import 'package:get/get.dart';

import '../controllers/quick_monitor_controller.dart';

class QuickMonitorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuickMonitorController>(() => QuickMonitorController());
  }
}
