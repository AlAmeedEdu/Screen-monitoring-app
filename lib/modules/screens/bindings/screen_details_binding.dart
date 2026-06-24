import 'package:get/get.dart';

import '../controllers/screen_details_controller.dart';

class ScreenDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScreenDetailsController>(() => ScreenDetailsController());
  }
}
