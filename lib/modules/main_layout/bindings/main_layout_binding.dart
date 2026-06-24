import 'package:get/get.dart';

import '../../home/controllers/home_controller.dart';
import '../../screens/controllers/screens_controller.dart';
import '../controllers/main_layout_controller.dart';

class MainLayoutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainLayoutController>(() => MainLayoutController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<ScreensController>(() => ScreensController());
  }
}
