import 'package:get/get.dart';

import '../controllers/screen_logs_controller.dart';

class ScreenLogsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScreenLogsController>(() => ScreenLogsController());
  }
}
