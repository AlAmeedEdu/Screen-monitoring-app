import 'package:get/get.dart';

import '../../home/controllers/home_controller.dart';
import '../../screens/controllers/screens_controller.dart';
import '../controllers/main_layout_controller.dart';

/// يسجل الاعتمادات والـ controllers اللازمة قبل فتح هذه الصفحة في GetX.
class MainLayoutBinding extends Bindings {
  /// يسجل الـ controllers أو الخدمات التي تحتاجها الصفحة قبل عرضها.
  @override
  void dependencies() {
    Get.lazyPut<MainLayoutController>(() => MainLayoutController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<ScreensController>(() => ScreensController());
  }
}
