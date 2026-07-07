import 'package:get/get.dart';

import '../controllers/screen_details_controller.dart';

/// يسجل الاعتمادات والـ controllers اللازمة قبل فتح هذه الصفحة في GetX.
class ScreenDetailsBinding extends Bindings {
  /// يسجل الـ controllers أو الخدمات التي تحتاجها الصفحة قبل عرضها.
  @override
  void dependencies() {
    Get.lazyPut<ScreenDetailsController>(() => ScreenDetailsController());
  }
}
